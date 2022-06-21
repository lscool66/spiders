# -*- coding: utf-8 -*-
"""
Created on 2021-05-23 08:06:54
---------
@summary: 爬虫入口
---------
@author: lscoo
"""

from feapder import ArgumentParser

from spiders.bus_ctrip_com_batch import BusCtripComBatch


def bus_ctrip_com_batch(args):
    spider = BusCtripComBatch(
        redis_key="feapder:xiecheng_batchspider",  # redis中存放任务等信息的根key
        task_table="_tos",  # mysql中的任务表
        task_keys=["id", "from", "to", "is_used", "url"],  # 需要获取任务表里的字段名，可添加多个
        task_state="state",  # mysql中任务状态字段
        batch_record_table="xiecheng_batch_record_1",  # mysql中的批次记录表
        batch_name="携程(近三天)",  # 批次名字
        batch_interval=1,  # 批次周期 天为单位 若为小时 可写 1 / 24
        task_condition="`is_used` = '1' AND `url` IS NOT NULL AND `from` IN (SELECT `from` FROM `spiders`.`_froms` WHERE `is_used` = '1')"
    )

    if args == 1:
        spider.start_monitor_task()
    elif args == 2:
        spider.start()
    elif args == 0:
        spider.init_task()
    elif args == -1:
        spider.to_DebugBatchSpider()
        spider.start()


if __name__ == "__main__":
    parser = ArgumentParser(description="xiecheng_bus")

    parser.add_argument(
        "--bus_ctrip_com_batch", type=int, nargs=1, help="(-1|0|1|2）", function=bus_ctrip_com_batch
    )

    parser.start()
