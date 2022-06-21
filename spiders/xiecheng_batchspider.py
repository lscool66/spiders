# -*- coding: utf-8 -*-
"""
Created on 2021-05-25 08:52:39
---------
@summary:
---------
@author: lscoo
"""

import feapder
from plugins.bus_spider_plugin import Plugin
from items.xiecheng_data_item import DataParamsItem
import json
from feapder.utils.log import log
from setting import IS_USED_NOTICKET_FILTER


class XiechengBatchspider(feapder.BatchSpider):

    def start_callback(self):
        log.info('爬虫开始了')

        # plugn = Plugin()
        # plugn.update_urls()

    def start_requests(self, task):

        _id, _from, _to = task["id"], task["from"], task["to"]
        log.info(f"任务id：{_id},开始抓取:{_from} to {_to}")

        for _date in Plugin().date_list:
            url = "https://m.ctrip.com/restapi/soa2/13906/json/busListV2"
            params = {
                "_fxpcqlniredt": "09031142310578278629",
                "x-traceID": "09031142310578278629-1639879543891-919945"
            }
            data = {
                "basicParams": {
                    "app": "ctrip",
                    "bigChannel": "bus",
                    "smallChannel": "pc_bus_nfes",
                    "clientVersion": "5.0.0",
                    "bigClientType": "ctrip_pc"
                },
                "union": {
                    "utmSource": "pc_bus_nfes",
                    "vid": "",
                    "scanId": "",
                    "clientVersion": "8.34.0",
                    "clientId": "09031142310578278629",
                    "clientType": "pc"
                },
                "newSortType": 1,
                "fromCity": _from,
                "toCity": _to,
                "fromDate": _date,
                "busListExtendParams": {
                    "busMixType": "1"
                },
                "supportIntervalSch": False,
                "head": {
                    "cid": "09031142310578278629",
                    "ctok": "",
                    "cver": "1.0",
                    "lang": "01",
                    "sid": "8888",
                    "syscode": "09",
                    "auth": "",
                    "xsid": "",
                    "extension": []
                }
            }
            data = json.dumps(data)
            yield feapder.Request(url, params=params, data=data, method="POST", task_id=_id)

    def download_midware(self, request):
        request.headers = {
            "authority": "m.ctrip.com",
            "sec-ch-ua": "\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"96\", \"Google Chrome\";v=\"96\"",
            "dnt": "1",
            "sec-ch-ua-mobile": "?0",
            "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36",
            "content-type": "text/plain;charset=UTF-8",
            "accept": "application/json",
            "cookieorigin": "https://bus.ctrip.com",
            "sec-ch-ua-platform": "\"Windows\"",
            "origin": "https://bus.ctrip.com",
            "sec-fetch-site": "same-site",
            "sec-fetch-mode": "cors",
            "sec-fetch-dest": "empty",
            "referer": "https://bus.ctrip.com/",
            "accept-language": "zh-CN,zh;q=0.9,en;q=0.8"
        }
        request.cookies = {
            "_RSG": "M1458BI9SX7XGQ20Z.Fx5B",
            "_RDG": "28171c90f73cd12a732107df5fd9ee6a06",
            "_RGUID": "785c2522-c814-4056-b17b-3fe8c009a421",
            "MKT_CKID": "1637234259830.ltozu.7ct4",
            "_ga": "GA1.2.48365392.1637234261",
            "nfes_isSupportWebP": "1",
            "GUID": "09031142310578278629",
            "_RF1": "218.7.222.20",
            "MKT_CKID_LMT": "1639879533250",
            "__zpspc": "9.2.1639879533.1639879533.1%232%7Cwww.baidu.com%7C%7C%7C%7C%23",
            "_gid": "GA1.2.1134580869.1639879533",
            "_gat": "1",
            "_jzqco": "%7C%7C%7C%7C1639879533498%7C1.289908227.1637234259836.1637234284055.1639879533255.1637234284055.1639879533255.0.0.0.3.3",
            "_bfa": "1.1637234257163.4cwy58.1.1637234257163.1639879530451.2.4",
            "_bfs": "1.2",
            "_bfi": "p1%3D10650066224%26p2%3D10650066222%26v1%3D4%26v2%3D3"
        }
        return request

    def parse(self, request, response):

        resp_json = response.json
        if 'data' in resp_json and "bus" in resp_json['data'] and "data" in resp_json['data']['bus'] and "busList" in \
                resp_json['data']['bus']["data"]:
            busList = resp_json['data']['bus']["data"]["busList"]
            for bus in busList:
                if IS_USED_NOTICKET_FILTER:
                    if bus['ticketStockStyle'] == 0:
                        continue
                yield DataParamsItem(**bus)

        yield self.update_task_batch(request.task_id, 1)

    def validate(self, request, response):
        if len(response.text) < 10:
            raise Exception(f"[{response.text.strip()}]")

    def exception_request(self, request, response):
        request.proxies_pool.reset_proxy_pool(force=True)

        yield request

    def failed_request(self, request, response):

        yield request
        yield self.update_task_batch(request.task_id, -1)

    def end_callback(self):

        log.info("爬虫结束了")

        plugin = Plugin()

        plugin.insert_data_params_sd()
        plugin.update_data_params()
        plugin.save_data_params_to_json()

        plugin.remove_old_data_files()
        plugin.remove_mysql_old_data()


if __name__ == "__main__":
    spider = XiechengBatchspider(
        redis_key="feapder:xiecheng_batchspider",  # redis中存放任务等信息的根key
        task_table="_tos",  # mysql中的任务表
        task_keys=["id", "from", "to", "is_used", "url"],  # 需要获取任务表里的字段名，可添加多个
        task_state="state",  # mysql中任务状态字段
        batch_record_table="xiecheng_batch_record_1",  # mysql中的批次记录表
        batch_name="携程(近三天)",  # 批次名字
        batch_interval=1,  # 批次周期 天为单位 若为小时 可写 1 / 24
        task_condition="`is_used` = '1' AND `url` IS NOT NULL AND `from` IN (SELECT `from` FROM `spiders`.`_froms` WHERE `is_used` = '1')"

    )

    # spider.start_monitor_task()  # 下发及监控任务
    spider.start()  # 采集
