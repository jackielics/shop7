# -*- coding: utf-8 -*-

# pip install pycryptodome


from datetime import datetime
from Crypto.PublicKey import RSA
from Crypto.Signature import PKCS1_v1_5
from Crypto.Hash import SHA256
from base64 import b64encode, b64decode
from urllib.parse import quote_plus
from urllib.parse import urlparse, parse_qs
from urllib.request import urlopen
from base64 import decodebytes, encodebytes

import json


class AliPay(object):
    """
    支付宝支付接口
    """
    def __init__(self, appid, app_notify_url, app_private_key_path,
                 alipay_public_key_path, return_url, debug=False):
        self.appid = appid  #支付宝分配给开发者的应用ID
        self.app_notify_url = app_notify_url  #回调url
        self.app_private_key_path = app_private_key_path
        self.app_private_key = None
        self.return_url = return_url
        #读取我们的私钥和alipay的公钥
        with open(self.app_private_key_path) as fp:
            self.app_private_key = RSA.importKey(fp.read())

        self.alipay_public_key_path = alipay_public_key_path
        with open(self.alipay_public_key_path) as fp:
            self.alipay_public_key = RSA.import_key(fp.read())


        if debug is True:
            self.__gateway = "https://openapi.alipaydev.com/gateway.do"
        else:
            self.__gateway = "https://openapi.alipay.com/gateway.do"

    def direct_pay(self, subject, out_trade_no, total_amount, return_url=None, **kwargs):
        #这里和官方文档中请求参数的必填写项次一样的
        biz_content = {
            "subject": subject,
            "out_trade_no": out_trade_no,
            "total_amount": total_amount,
            "product_code": "FAST_INSTANT_TRADE_PAY",
            # "qr_pay_mode":4
        }

        biz_content.update(kwargs)
        data = self.build_body("alipay.trade.page.pay", biz_content, self.return_url)
        return self.sign_data(data)
    #这里和我们公共请求参数一样的
    def build_body(self, method, biz_content, return_url=None):
        data = {
            "app_id": self.appid,
            "method": method,
            "charset": "utf-8",
            "sign_type": "RSA2",
            "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "version": "1.0",
            "biz_content": biz_content
        }

        if return_url is not None:
            data["notify_url"] = self.app_notify_url
            data["return_url"] = self.return_url

        return data
    #签名，所有的支付宝请求都需要签名
    def sign_data(self, data):
        #如果data中有sign这个字段我们先清除
        data.pop("sign", None)
        # 排序后的字符串
        unsigned_items = self.ordered_data(data)
        unsigned_string = "&".join("{0}={1}".format(k, v) for k, v in unsigned_items)
        sign = self.sign(unsigned_string.encode("utf-8"))
        # ordered_items = self.ordered_data(data)
        #quote_plus主要是针对含有冒号双斜杠等进行处理
        quoted_string = "&".join("{0}={1}".format(k, quote_plus(v)) for k, v in unsigned_items)

        # 把sign加上，获得最终的订单信息字符串
        signed_string = quoted_string + "&sign=" + quote_plus(sign)
        return signed_string

    def ordered_data(self, data):
        complex_keys = []
        for key, value in data.items():
            if isinstance(value, dict):
                complex_keys.append(key)

        # 将字典类型的数据dump出来
        for key in complex_keys:
            data[key] = json.dumps(data[key], separators=(',', ':'))

        return sorted([(k, v) for k, v in data.items()])
    #按照支付宝官方给的手法签名
    def sign(self, unsigned_string):
        # 开始计算签名
        key = self.app_private_key
        signer = PKCS1_v1_5.new(key)
        signature = signer.sign(SHA256.new(unsigned_string))
        # base64 编码，转换为unicode表示并移除回车
        sign = encodebytes(signature).decode("utf8").replace("\n", "")
        return sign

    def _verify(self, raw_content, signature):
        # 开始计算签名，使用阿里给我们的公钥，对阿里返回的签名是否正确
        key = self.alipay_public_key
        signer = PKCS1_v1_5.new(key)
        digest = SHA256.new()
        digest.update(raw_content.encode("utf8"))
        if signer.verify(digest, decodebytes(signature.encode("utf8"))):
            return True
        return False

    def verify(self, data, signature):
        if "sign_type" in data:
            sign_type = data.pop("sign_type")
        # 排序后的字符串
        unsigned_items = self.ordered_data(data)
        message = "&".join(u"{}={}".format(k, v) for k, v in unsigned_items)
        return self._verify(message, signature)

#拿到支付宝返回给我们的url，进行解析，为了防止黑客截获，

if __name__ == "__main__":
    IP="127.0.0.1:7000"#你要改，改为你的公网IP和监听端口
    return_url = 'http://42.192.117.114/alipay/return/?charset=utf-8&out_trade_no=20210907163741149&method=alipay.trade.page.pay.return&total_amount=100.00&sign=tIb5MV14RbohJS5D5jnZWgSRTD2F1HU0i51fA%2BiH5tgLRaMP%2Fr%2B6Ns%2FYISJBKFkpjQzPvtBvR%2BQM%2BpWCjUXjhvAaANzA%2BXfEzp6gU94WU7Rzg3HTB8cbHw1qD58TmFHISkfdwmTQGtLpcM1umAm0bt%2FAVbR6s9YqS6wgntLyZFOS1dQIR952YvW4AKz%2B8Zp7dxdd9ZKn4V4SRkW3ogWSfuKs04pqKFIxbMSXwxHtfUoNTp5pXztFqBJrG1CIATy6IoaJ7RvJNZ0ASyU6NAIQqc3L0k24alDEwYzOujTqiIlVHx3A5mv%2FiGJHe6e8srrDormmfDefo2I6UCvgVJv8nw%3D%3D&trade_no=2021090722001490421000205277&auth_app_id=2016101400687743&version=1.0&app_id=2016101400687743&sign_type=RSA2&seller_id=2088102179599265&timestamp=2021-09-07+15%3A28%3A50'
    o = urlparse(return_url)
    query = parse_qs(o.query)
    processed_query = {}
    ali_sign = query.pop("sign")[0]


    alipay = AliPay(
        appid="2016101400687743",#放入我们的应用ID,你要改，改成你自己的
        app_notify_url="http://"+IP+"/alipay/return/",#异步的请求接收接口，就是用户扫描后，没支付，然后再次打开支付宝去支付
        app_private_key_path="../trade/keys/private_2048",#本地加密的
        alipay_public_key_path="../trade/keys/alipay_key_2048",  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
        debug=True,  # 默认False,
        return_url="http://"+IP+"/alipay/return/"
    )

    for key, value in query.items():
        processed_query[key] = value[0]
    print(alipay.verify(processed_query, ali_sign)) #这个验签是验证支付宝那边返回给我们的url的
    #------------------上面部分是验证支付宝过来的url的签名的，下面是首先要演示的----------------
    url = alipay.direct_pay(
        subject="20230407113133165",#改成自己的订单ID
        out_trade_no="20230407113133165",#随便写一个测试用
        total_amount=100,
        return_url="http://"+IP+"/alipay/return/"#支付完成后跳回的页面
    )#我们要把这个url拿到我们的alipay的url中
    re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)

    print(re_url)