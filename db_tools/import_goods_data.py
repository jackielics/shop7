# -*- coding: utf-8 -*-

import sys
import os


pwd = os.path.dirname(os.path.realpath(__file__))
sys.path.append(pwd+"../")
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'shop7.settings')

import django
django.setup()

from goods.models import Goods, GoodsCategory, GoodsImage

from db_tools.data.product_data import row_data #row_data是列表

for goods_detail in row_data:#goods_detail是字典
    goods = Goods()
    goods.name = goods_detail["name"]
    goods.market_price = float(int(goods_detail["market_price"].replace("￥", "").replace("元", "")))
    goods.shop_price = float(int(goods_detail["sale_price"].replace("￥", "").replace("元", "")))
    goods.goods_brief = goods_detail["desc"] if goods_detail["desc"] is not None else "" #为空给空字符串
    goods.goods_desc = goods_detail["goods_desc"] if goods_detail["goods_desc"] is not None else ""
    goods.goods_front_image = goods_detail["images"][0] if goods_detail["images"] else ""

    category_name = goods_detail["categorys"][-1]
    category = GoodsCategory.objects.filter(name=category_name)#为什么用filter不用get，因为用filter不需要try和catch
    if category:
        goods.category = category[0] #因为category是queryset类型，[0]后变为category对象
    goods.save()

    for goods_image in goods_detail["images"]:#把商品图片放入GoodsImage表中
        goods_image_instance = GoodsImage()
        goods_image_instance.image = goods_image
        goods_image_instance.goods = goods
        goods_image_instance.save()