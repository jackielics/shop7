# 作者: 王道 龙哥
# 2023年04月06日16时59分18秒
import time
from random import Random

from rest_framework import serializers

from goods.models import Goods
from goods.serializers import GoodsSerializer
from .models import ShoppingCart, OrderInfo, OrderGoods


class ShopCartDetailSerializer(serializers.ModelSerializer):
    goods = GoodsSerializer(many=False, read_only=True)

    class Meta:
        model = ShoppingCart
        fields = ("goods", "nums")


# 继承的是Serializer，无需写class Meta
class ShopCartSerializer(serializers.Serializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    nums = serializers.IntegerField(required=True, label="数量", min_value=1,
                                    error_messages={
                                        "min_value": "商品数量不能小于一",
                                        "required": "请选择购买数量"
                                    })
    goods = serializers.PrimaryKeyRelatedField(required=True, queryset=Goods.objects.all())

    def create(self, validated_data):
        user = self.context["request"].user  # 为了学习可以去上下文中拿Request
        nums = validated_data["nums"]
        goods = validated_data["goods"]

        #拿对应用户，对应商品，购物车中是否存在
        existed = ShoppingCart.objects.filter(user=user, goods=goods)

        if existed:  # 购物车原有已经有了这个
            existed = existed[0]
            existed.nums += nums
            existed.save()
        else:
            existed = ShoppingCart.objects.create(**validated_data)

        return existed

    def update(self, instance, validated_data):
        # 修改商品数量，前端直接把用户修改后的商品数量传递过来
        instance.nums = validated_data["nums"]
        instance.save()
        return instance


class ShopCartDetailSerializer(serializers.ModelSerializer):
    """
    用于购物车列表
    """
    goods = GoodsSerializer(many=False, read_only=True)

    class Meta:
        model = ShoppingCart
        fields = ("goods", "nums")


from utils.alipay import AliPay
from shop7.settings import ali_pub_key_path, private_key_path
from shop7.settings import server_ip,appid
class OrderSerializer(serializers.ModelSerializer):
    #用户信息默认不用提交，因为我们已经登录，当然知道谁提交订单
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    pay_status = serializers.CharField(read_only=True)  # 订单支付状态
    trade_no = serializers.CharField(read_only=True)  # 这是支付宝用的
    order_sn = serializers.CharField(read_only=True)  #订单编号是自动生成的
    pay_time = serializers.DateTimeField(read_only=True)  # 这个是支付时间，当然也是自动生成
    add_time = serializers.DateTimeField(read_only=True)  #订单添加时间，自动生成的
    # SerializerMethodField自定义的serializer，无需用户提交
    alipay_url = serializers.SerializerMethodField(read_only=True)

    #生成支付链接，这个url发给前端，后端不存这个url，用户点击这个url会直接跳转到支付宝的界面
    def get_alipay_url(self, obj):

        alipay = AliPay(
            appid=appid,  # 要改
            # app_notify_url="http://127.0.0.1:8000/alipay/return/",
            app_notify_url="http://" + server_ip + "/alipay/return/",
            app_private_key_path=private_key_path,
            alipay_public_key_path=ali_pub_key_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            debug=True,  # 默认False,
            return_url="http://" + server_ip + "/alipay/return/"
        )

        url = alipay.direct_pay(
            subject=obj.order_sn,
            out_trade_no=obj.order_sn,
            total_amount=obj.order_mount,
        )
        re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)

        return re_url
    #订单号每次随机生成
    def generate_order_sn(self):
        # 当前时间+userid+随机数
        random_ins = Random()
        order_sn = "{time_str}{userid}{ranstr}".format(time_str=time.strftime("%Y%m%d%H%M%S"),
                                                       userid=self.context["request"].user.id, ranstr=random_ins.randint(10, 99))

        return order_sn

    def validate(self, attrs):
        #生成订单号填写进去
        attrs["order_sn"] = self.generate_order_sn()
        return attrs

    class Meta:
        model = OrderInfo
        fields = "__all__"


# 用来显示订单详情中的商品详情
class OrderGoodsSerialzier(serializers.ModelSerializer):
    goods = GoodsSerializer(many=False)  # 一个商品id只会对应一件商品

    class Meta:
        model = OrderGoods
        fields = "__all__"



class OrderDetailSerializer(serializers.ModelSerializer):
    goods = OrderGoodsSerialzier(many=True)  # 一个订单id可以有多个商品
    # SerializerMethodField自定义的serializer，无需用户提交
    alipay_url = serializers.SerializerMethodField(read_only=True)

    def get_alipay_url(self, obj):

        alipay = AliPay(
            appid=appid,
            # app_notify_url="http://127.0.0.1:8000/alipay/return/",
            app_notify_url="http://" + server_ip + "/alipay/return/",
            app_private_key_path=private_key_path,
            alipay_public_key_path=ali_pub_key_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            debug=True,  # 默认False,
            return_url="http://" + server_ip + "/alipay/return/"
        )
        url = alipay.direct_pay(
            subject=obj.order_sn,
            out_trade_no=obj.order_sn,
            total_amount=obj.order_mount,
        )
        re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)

        return re_url  #给前端用户

    class Meta:
        model = OrderInfo
        fields = "__all__"