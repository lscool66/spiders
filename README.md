写在前面

所需工具软件包

链接：https://pan.baidu.com/s/1KCWKXYouwiXKEyA_yKmRtQ 
提取码：6666 
复制这段内容后打开百度网盘手机App，操作更方便哦


# 1 在哪个配置文件设置每天开始跑的时间啊

---

1. 开始跑的时间为运行程序的时间


1.  可以自行设置运行周期
`文件路径`
spiders\batch_spider_xiecheng.py


![image-20210525134219570](https://i.loli.net/2021/05/25/e9Jx5mNlkpMCLhB.png)



```python
spider = BatchSpiderXiecheng(
    redis_key="feapder:batch_spider_xiecheng",  # redis中存放任务等信息的根key
    task_table="_tos",  # mysql中的任务表
    task_keys=["id", "url"],  # 需要获取任务表里的字段名，可添加多个
    task_state="state",  # mysql中任务状态字段
    batch_record_table="xiecheng_batch_record",  # mysql中的批次记录表
    batch_name="携程(近三天)",  # 批次名字
    #修改以下数值即可
    batch_interval=1,  # 批次周期 天为单位 若为小时 可写 1 / 24
)
```





# 2 速度啊

---

1. 修改设置文件

setting.py



![image-20210525134437703](https://i.loli.net/2021/05/25/MvufHQe4TRBoKrt.png)



```python
# # SPIDER
# 此处设置爬虫速度
SPIDER_THREAD_COUNT = 8  # 爬虫并发数
SPIDER_SLEEP_TIME = 0  # 下载时间间隔（解析完一个response后休眠时间）
SPIDER_TASK_COUNT = 64  # 每个parser从内存队列中获取任务的数量
SPIDER_MAX_RETRY_TIMES = 100  # 每个请求最大重试次数
AUTO_STOP_WHEN_SPIDER_DONE = False  # 爬虫是否自动结束
```



2. 本爬虫支持分布式部署，即爬虫可以启动多次，运行效率取决于网速，服务器性能，代理IP质量等多种因素





# 3 如何部署到服务器

---



1. 环境 python3.6+，mysql，redis

具体如何安装网上教程一大堆，此不再赘述

下载地址

[Welcome to Python.org](https://www.python.org/)

https://downloads.mysql.com/archives/installer/

[Releases · tporadowski/redis (github.com)](https://github.com/tporadowski/redis/releases)





![image-20210525134748174](https://i.loli.net/2021/05/25/N2LjUfIqEXix8De.png)


2. python依赖库

    命令行下运行

```python
pip install feapder
```

# 4 运行哪个程序啊

---

进入到程序路径下空白处按住shift点击鼠标`右键`



![image-20210525141518744](https://i.loli.net/2021/05/25/zACSMEhO3fxFPqd.png)

1.  启动监控程序



![image-20210525141734143](https://i.loli.net/2021/05/25/yBsta1l3UKp5Xcj.png)



```powershell
python main.py --batch_crawl_xiecheng 1
```

2.  启动执行程序 

![image-20210525141850368](https://i.loli.net/2021/05/25/1yvOCZ9KiqQb5Bx.png)

```powershell
python main.py --batch_crawl_xiecheng 2
```

`注意 执行程序可以重启动多次用来提升效率`



# 5 如何设置IP自动切换

---

1.  文件名`plugn.py`

修改完毕以下api地址既可以在程序执行过程中自动切换代理地址



![image-20210525133610604](https://i.loli.net/2021/05/25/6oI2pwzUFZAKlda.png)



```python
def get_proxies(self):
    #修改這個地址為自己申請的地址即可
    api = 'http://api2.xkdaili.com/tools/XApi.ashx?apikey=XK13CD0F2F9560ACA668&qty=1&format=txt&split=2'
    ip_port = requests.get(api).text.strip()
    if len(ip_port) < 25:
        proxies = {
            'http': f'http://{ip_port}',
            'https': f'https://{ip_port}'
        }
        return proxies
    else:
        print(ip_port)
        return None
```



2.  代理地址获取方式

http://www.xkdaili.com/?ic=1d4z9q9s



3.  购买相应套餐

![image-20210525134011745](https://i.loli.net/2021/05/25/r1L243nzhfeIZWM.png)



4.  生成接口地址



![image-20210525133908421](https://i.loli.net/2021/05/25/Pz2BVlYfW9JAjgb.png)

`如果想更换购买的服务商，跟开发者沟通重新开发接口即可`

# 6 如何设置替换逻辑

---



1.  修改以下两个表格即可



![image-20210525140839575](https://i.loli.net/2021/05/25/NbGu94qUlE3oWAy.png)



2.  is_used 表示是否启用



![image-20210525140851193](https://i.loli.net/2021/05/25/KrXhuIb8BomFUep.png)









![image-20210525140900102](https://i.loli.net/2021/05/25/12JfITepMLdzX9w.png)



3.  如果是windows服务器上安装

    使用开发则在服务器上安装好的软件可以对数据表直接进行修改

    ![image-20210525141027103](https://i.loli.net/2021/05/25/LXPtQEA2oOqgp3F.png)

    ![image-20210525141051814](https://i.loli.net/2021/05/25/y7GQCorjS1M2Y6n.png)

4.  依次打开即可

![image-20210525141112566](https://i.loli.net/2021/05/25/GpoJikh2dsAWCNL.png)





![image-20210525141157487](https://i.loli.net/2021/05/25/Bhli4Q8c9bnyNRz.png)



5.  软件左下角有相对应按钮



​	直接修改完毕点击对勾即可保存

​	添加点击 +

​	删除点击 -

​	
