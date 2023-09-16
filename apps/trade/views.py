from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from rest_framework import viewsets, mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from shop7.settings import private_key_path, ali_pub_key_path
from utils.alipay import AliPay
from .models import ShoppingCart, OrderInfo, OrderGoods
from .permissions import IsOwnerOrReadOnly
from .serializers import ShopCartSerializer, ShopCartDetailSerializer, OrderSerializer, OrderDetailSerializer


class ShoppingCartViewset(viewsets.ModelViewSet):
    """
    购物车功能
    list:
        获取购物车详情
    create：
        加入购物车
    delete：
        删除购物记录
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    serializer_class = ShopCartSerializer

    # 每个用户只能看到自己购物车内的商品
    def get_queryset(self):
        return ShoppingCart.objects.filter(user=self.request.user)

    lookup_field = "goods_id"

    # 注释这个会造成购物车中的商品详情无法显示
    def get_serializer_class(self):
        if self.action == 'list':
            return ShopCartDetailSerializer
        else:
            return ShopCartSerializer

    # 加入购物车几个就把商品数目减去几个
    def perform_create(self, serializer):
        shop_cart = serializer.save()
        goods = shop_cart.goods
        goods.goods_num -= shop_cart.nums #往购物车加几个商品，就扣几个
        goods.save()

    # 购物车数目删除几个，就加回去
    def perform_destroy(self, instance):
        goods = instance.goods
        #购物车删除的商品，把数目加回去
        goods.goods_num += instance.nums
        goods.save()
        instance.delete()

    # 修改了购物车数目，也要
    def perform_update(self, serializer):
        existed_record = ShoppingCart.objects.get(id=serializer.instance.id)
        existed_nums = existed_record.nums  # 变化之前的数量，因为变化之前的数量是存入了数据库的
        saved_record = serializer.save()  # 变化后的数量存入数据库
        nums = saved_record.nums - existed_nums  # nums可正可负
        goods = saved_record.goods
        goods.goods_num -= nums
        goods.save()  # 把商品库存数目更新

class OrderViewset(mixins.ListModelMixin, mixins.RetrieveModelMixin,
                   mixins.CreateModelMixin, mixins.DestroyModelMixin,
                   viewsets.GenericViewSet):
    """
    订单管理
    list:
        获取个人订单
    delete:
        删除订单
    create：
        新增订单
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)

    # serializer_class = OrderSerializer

    def get_queryset(self):
        return OrderInfo.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == "retrieve":
            return OrderDetailSerializer  # 要显示订单内的商品详情
        return OrderSerializer

    # perform_create用于对我们的实例进行修改
    def perform_create(self, serializer):
        # 首先先生存一个订单
        order = serializer.save()
        # 拿到对应用户的购物车中的信息
        shop_carts = ShoppingCart.objects.filter(user=self.request.user)
        # 遍历购物车
        for shop_cart in shop_carts:
            order_goods = OrderGoods()
            order_goods.goods = shop_cart.goods
            order_goods.goods_num = shop_cart.nums
            order_goods.order = order
            # 订单商品信息保存
            order_goods.save()
            # 清空购物车对应的那个商品
            shop_cart.delete()

        return order

from shop7.settings import server_ip,appid
from datetime import datetime
class AlipayView(APIView):
    # 让页面从新回到我们的网站
    def get(self, request):
        """
        处理支付宝的return_url返回
        :param request:
        :return:
        """
        processed_dict = {}
        for key, value in request.GET.items():#拿请求url中的参数
            processed_dict[key] = value

        sign = processed_dict.pop("sign", None) #弹出签名
        alipay = AliPay(
            appid=appid,
            # app_notify_url="http://127.0.0.1:8000/alipay/return/",
            app_notify_url="http://" + server_ip + "/alipay/return/",
            app_private_key_path=private_key_path,
            alipay_public_key_path=ali_pub_key_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            debug=True,  # 默认False,
            return_url="http://" + server_ip + "/alipay/return/"
        )
        verify_re = alipay.verify(processed_dict, sign)#验签
        # 这里我们可以调试看一下，如果verify_re为真，说明验证成功
        if verify_re is True:
            response = redirect("/index/#/app/home/member/order")
            # response.set_cookie("nextPath","pay", max_age=3)
            return response
        else:
            response = redirect("/index/#/app/home/member/order")
            return response

    def post(self, request):
        """
        处理支付宝的notify_url，异步的，支付宝发过来的是post请求
        :param request:
        :return:
        """
        processed_dict = {}  # 存储post请求的字典内容

        for key, value in request.POST.items():#从POST拿数据出来
            processed_dict[key] = value

        sign = processed_dict.pop("sign", None)
        alipay = AliPay(
            appid=appid,
            # app_notify_url="http://127.0.0.1:8000/alipay/return/",
            app_notify_url="http://" + server_ip + "/alipay/return/",
            app_private_key_path=private_key_path,
            alipay_public_key_path=ali_pub_key_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            debug=True,  # 默认False,
            return_url="http://" + server_ip + "/alipay/return/"
        )
        verify_re = alipay.verify(processed_dict, sign)

        if verify_re is True:
            order_sn = processed_dict.get('out_trade_no', None)  # 订单号
            trade_no = processed_dict.get('trade_no', None)  # 支付宝会给每一个订单一个交易编号
            trade_status = processed_dict.get('trade_status', None)  # 支付状态

            #查询对应的订单
            existed_orders = OrderInfo.objects.filter(order_sn=order_sn)
            for existed_order in existed_orders:
                order_goods = existed_order.goods.all()
                for order_good in order_goods:  # 支付后，对对应商品的卖出数量进行添加
                    goods = order_good.goods
                    goods.sold_num += order_good.goods_num
                    goods.save()

                existed_order.pay_status = trade_status
                existed_order.trade_no = trade_no
                existed_order.pay_time = datetime.now()
                existed_order.save()

            return HttpResponse("success")  # 我们要给阿里response一个success，否则它会一直给我们消息
