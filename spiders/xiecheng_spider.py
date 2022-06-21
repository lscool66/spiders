# -*- coding: utf-8 -*-
"""
Created on 2021-05-23 14:00:02
---------
@summary:
---------
@author: lscoo
"""

from copy import deepcopy

import demjson
import feapder
import parsel
from feapder.utils.log import log

from items.xiecheng_data_item import XiechengDataItem
from items.xiecheng_data_record_item import XiechengDataRecordItem
from plugins.bus_spider_plugin import Plugin


class XiechengSpider(feapder.Spider):

    def start_callback(self):
        log.info("爬虫开始了")
        plugin = Plugin(used_for='xiecheng')
        plugin.update_tasks()

    def start_requests(self):
        plugin = Plugin(used_for='xiecheng')
        res = plugin.get_tasks()
        for i in res:
            params = {
                'param': '/busList/getAjaxList',
                'from': i['fromCity'],
                'to': i['toCity'],
                'date': i['date'],
                'sortName': 'from_time',
                'sortType': 'asc',
                'flash_type': 'table',
                'page': 1,
                'timeRange': 'all',
                'fromStations': 'all'
            }
            yield feapder.Request(url='https://bus.ctrip.com/index.php', params=params, verify=False)

    def parse(self, request, response):

        params = deepcopy(request.params)

        resp_json = response.json
        _return = resp_json['return']

        totalPage = _return['totalPage']
        page = _return['page']

        count = _return['count']
        html = _return['html']

        selector = parsel.Selector(html)
        tds = selector.xpath('//td[@class="text_right"]')

        log.info(f"正在解析第 {page}/{totalPage} 页数据 共 {count} 条数据")

        num = 0
        for td in tds:
            num += 1
            item = {'_date': params['date'], '_from': params['from'], '_to': params['to'], 'page': page, 'num': num}
            base_full_price = td.xpath('../td[@class="price"]/div/div/span/text()').get()
            item['base_full_price'] = base_full_price
            data_params = td.xpath('.//div/@data-params').get()
            if data_params:
                data_params = demjson.decode(data_params)

                yield XiechengDataItem(**data_params)

                log.info(
                    f"{params['date']}-{params['from']}-{params['to']} 第{page}/{totalPage}页 第{num}/{count}条 数据有效 车票状态为订票 车票数据为{data_params}")

                item['data_params'] = data_params
                item['value'] = "订票"
            else:
                data_params = td.xpath('./input/@data-params').get()
                if data_params:
                    data_params = demjson.decode(data_params)
                    item['data_params'] = data_params
                value = td.xpath('./input/@value').get()
                item['value'] = value
                log.info(
                    f"{params['date']}-{params['from']}-{params['to']} 第{page}/{totalPage}页 第{num}/{count}条 数据无效 车票状态为{value} 车票数据为{data_params}")

            yield XiechengDataRecordItem(**item)

        if page < totalPage:
            params['page'] += 1
            url = request.url
            log.info(
                f"{params['date']}-{params['from']}-{params['to']} 共{totalPage}页数据 正在下发第{page + 1}页数据请求\n请求参数为:{url} {params}")
            yield feapder.Request(url, params=params, verify=False)

    def validate(self, request, response):
        if len(response.text) < 10:
            raise Exception(f"{response.text.strip()}")

    def exception_request(self, request, response):

        request.proxies_pool.reset_proxy_pool(force=True)
        yield request

    def failed_request(self, request, response):
        yield request

    def end_callback(self):
        log.info("爬虫结束了")
        plugin = Plugin(used_for='xiecheng')
        plugin.update_xiecheng_data()
        plugin.save_xiecheng_data_to_json()


if __name__ == "__main__":
    spider = XiechengSpider(redis_key="feapder:xiecheng_spider")
    spider.start()
