# -*- coding = utf-8 -*-
# @Time : 2021/5/22 11:31
# @Author : lscool66
# @File : plugin.py
# @Software : PyCharm
import json

import os
from datetime import date, timedelta, datetime

from feapder.db.mysqldb import MysqlDB
from feapder.db.redisdb import RedisDB
from feapder.utils.log import log
import shutil
from setting import DATA_SAVE_DAYS

from feapder.dedup import Dedup


class Plugin(object):

    def __init__(self):

        self._date_list = [(date.today() + timedelta(days=i)).strftime("%Y-%m-%d") for i in range(3)]
        self.two_days_ago = (date.today() + timedelta(days=-2)).strftime("%Y-%m-%d")
        self.file_path = os.path.abspath(__file__)
        self.base_dir = os.path.dirname(self.file_path)

        self.mysqldb = MysqlDB()
        self.redis_db = RedisDB()

    def get_path(self, *path):

        file_path = os.path.join(self.base_dir, *path)

        if not os.path.exists(file_path):
            os.makedirs(file_path)
        return file_path

    # def update_urls(self):
    #
    #     sql = "SELECT `from` FROM `_froms` WHERE `is_used`=1;"
    #     res = self.mysqldb.find(sql, to_json=True)
    #
    #     for i in res:
    #         _from = i['from']
    #
    #         sql2 = f"SELECT `from`,`to` FROM `_tos` WHERE `from` ='{_from}' AND `is_used`=1 AND `url` IS NULL;"
    #
    #         res2 = self.mysqldb.find(sql2, to_json=True)
    #
    #         for j in res2:
    #             to = j['to']
    #             url = f"https://bus.ctrip.com/index.php?param=/busList/getAjaxList&from={_from}&to={to}&date=_date&sortName=from_time&sortType=asc&flash_type=table&page=1&timeRange=all&fromStations=all"
    #
    #             state = self.mysqldb.update_smart(
    #                 '_tos', {"url": url}, condition=f"`from` = '{_from}' AND `to` = '{to}';")
    #             log.info(state)

    # def get_urls_from_mysql(self):
    #
    #     sql = "SELECT `from` FROM `_froms` WHERE `is_used`=1;"
    #     res = self.mysqldb.find(sql, to_json=True)
    #
    #     for _date in self._date_list:
    #
    #         for i in res:
    #             _from = i['from']
    #
    #             sql2 = f"SELECT `from`,`to`,`url` FROM `_tos` WHERE `from` ='{_from}' AND `is_used`=1;"
    #
    #             res2 = self.mysqldb.find(sql2, to_json=True)
    #
    #             for j in res2:
    #                 url = j['url'].replace('_date', _date)
    #                 yield url

    def save_xiecheng_bus_to_json(self):
        sql = 'SELECT `from` FROM _froms WHERE is_used = 1'
        res = self.mysqldb.find(sql, to_json=True)
        for _date in self._date_list:
            for i in res:
                _from = i['from']
                file_path = self.get_path('lines', _date.replace('-', ''))
                file_name = os.path.join(file_path, f"{_from}.json")

                sql1 = f"SELECT DISTINCT `data_params` FROM `spiders`.`spider_xiecheng_bus_list` WHERE `_from` = '{_from}' AND `_date` = '{_date}' AND `data_params` NOT IN ('停售','预订','无票','已发车','暂停网售')"
                res2 = self.mysqldb.find(sql1, to_json=True)

                data_params = []
                for j in res2:
                    data_params.append(j['data_params'])
                with open(file_name, mode='w', encoding='utf-8') as f:
                    f.write(json.dumps(data_params, ensure_ascii=False, indent=4))
                log.info(file_name, '保存成功')

    def update_data_params(self):
        sql = "SELECT * FROM `spiders`.`replace_businfo_configure` WHERE is_used = 1"
        res = self.mysqldb.find(sql, to_json=True)

        for i in res:
            original_fromStation = i['original_fromStation']
            original_toStation = i['original_toStation']
            original_fromTime = i['original_fromTime']

            state = i['state']
            if state == 0:
                update_data = {'is_used': 0}
                status = self.mysqldb.update_smart('data_params', update_data,
                                                   condition=f"`fromStation` = '{original_fromStation}' AND `toStation` = '{original_toStation}' AND `fromTime` = '{original_fromTime}'")
                log.info(
                    f"起始站:[{original_fromStation}] 终点站:[{original_toStation}] 发车时间:[{original_fromTime}] 更新数据为 [{update_data}] 状态：[{status}]")
            if state == 1:
                update_data = {}

                new_fromCity = i['new_fromCity']
                if new_fromCity is not None:
                    update_data['fromCity'] = new_fromCity

                new_fromStation = i['new_fromStation']
                if new_fromStation is not None:
                    update_data['fromStation'] = new_fromStation

                new_toCity = i['new_toCity']
                if new_toCity is not None:
                    update_data['toCity'] = new_toCity

                new_toStation = i['new_toStation']
                if new_toStation is not None:
                    update_data['toStation'] = new_toStation

                status = self.mysqldb.update_smart('data_params', update_data,
                                                   condition=f"`fromStation` = '{original_fromStation}' AND `toStation` = '{original_toStation}' AND `fromTime` = '{original_fromTime}'")

                log.info(
                    f"起始站:[{original_fromStation}] 终点站:[{original_toStation}] 发车时间:[{original_fromTime}] 更新数据为 [{update_data}] 状态：[{status}]")

    def insert_data_params_sd(self):
        sql = "SELECT DISTINCT `symbol`, `fromCity`, `fromStation`, `toCity`, `toStation`, `busNumber`, `fromDate`, " \
              "`fromTime`, `fullPrice`, `utmSource`, `hashkey`, `return_type`, `discount_count`, `discount_price`, " \
              "`active_stop_flag`, `vendor_activity_id`, `active_start_dttm`, `active_end_dttm`, " \
              "`vendor_activity_flag`, `vendor`, `data_source`, `begin_service_time`, `end_service_time`, " \
              "`phone_number`, `shift_type`, `serviceFee` FROM `spiders`.`insert_businfo_configure` WHERE `is_used` = " \
              "'1' "
        res = self.mysqldb.find(sql, to_json=True)
        dedup = Dedup()
        for _date in self._date_list:
            for i in res:
                i['fromDate'] = _date
                state = dedup.add(i)
                if state == 1:

                    r = self.mysqldb.add_smart('data_params', i)
                    log.info(f"插入{i} 状态 {r}")
                else:
                    log.info(f'{i} 该条数据重复')

    def insert_data_params(self):
        sql = "SELECT DISTINCT `symbol`, `fromCity`, `fromStation`, `toCity`, `toStation`, `busNumber`, `fromDate`, " \
              "`fromTime`, `fullPrice`, `utmSource`, `hashkey`, `return_type`, `discount_count`, `discount_price`, " \
              "`active_stop_flag`, `vendor_activity_id`, `active_start_dttm`, `active_end_dttm`, " \
              "`vendor_activity_flag`, `vendor`, `data_source`, `begin_service_time`, `end_service_time`, " \
              "`phone_number`, `shift_type`, `serviceFee` FROM `spiders`.`insert_businfo_configure` WHERE `is_used` = " \
              "'1' "
        res = self.mysqldb.find(sql, to_json=True)
        for _date in self._date_list:
            for i in res:
                i['fromDate'] = _date
                yield i

    def save_data_params_to_json(self):

        sql = 'SELECT DISTINCT `from` FROM _froms WHERE is_used = 1;'

        res = self.mysqldb.find(sql, to_json=True)

        for _date in self._date_list:
            for i in res:
                _from = i['from']
                sql1 = f"SELECT DISTINCT `symbol`, `fromCity`, `fromStation`, `toCity`, `toStation`, `busNumber`, `fromDate`, `fromTime`, `fullPrice`, `utmSource`, `hashkey`, `return_type`, `discount_count`, `discount_price`, `active_stop_flag`, `vendor_activity_id`, `active_start_dttm`, `active_end_dttm`, `vendor_activity_flag`, `vendor`, `data_source`, `begin_service_time`, `end_service_time`, `phone_number`, `shift_type`, `serviceFee` FROM `spiders`.`data_params` WHERE `fromDate` = '{_date}' AND `fromCity` = '{_from}' AND `is_used` = 1;"

                res1 = self.mysqldb.find(sql1, to_json=True)
                file_path = self.get_path('lines', _date.replace('-', ''))
                file_name = os.path.join(file_path, f"{_from}.json")
                with open(file_name, mode='w', encoding='utf-8') as f:
                    f.write(json.dumps(res1, ensure_ascii=False, indent=4))
                log.info(f'{file_name} 保存完毕')

    def remove_old_data_files(self):

        dir_path = self.get_path('lines')

        for dir_name in os.listdir(dir_path):
            # date_str = '-'.join([dir_name[0:4], dir_name[4:6], dir_name[6:8]])
            _date = datetime.date(datetime.strptime(dir_name, '%Y%m%d'))
            if _date < date.today() - timedelta(days=DATA_SAVE_DAYS):
                del_dir_path = os.path.join(dir_path, dir_name)
                if os.path.exists(del_dir_path):
                    try:
                        shutil.rmtree(del_dir_path)
                        log.info(f"{del_dir_path} 删除成功")
                    except Exception as e:
                        log.info(e)
                        log.info(f"{del_dir_path} 删除失败")

    def remove_mysql_old_data(self):

        today = date.today() - timedelta(days=DATA_SAVE_DAYS)
        sql = f"DELETE FROM `spiders`.`data_params` WHERE `fromDate` < '{today}';"
        res = self.mysqldb.delete(sql)
        if res:
            log.info(f"数据表 data_params 已经删除 {today} 以前的数据")

        sql1 = f"DELETE FROM `spiders`.`spider_xiecheng_bus_list`  WHERE `_date` < '{today}';"

        res1 = self.mysqldb.delete(sql1)

        if res1:
            log.info(f"数据表 spider_xiecheng_bus_list 已经删除 {today} 以前的数据")

    @property
    def date_list(self):
        return self._date_list


if __name__ == '__main__':
    plugin = Plugin()
    # plugn.update_urls()
