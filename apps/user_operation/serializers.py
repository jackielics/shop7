# 作者: 王道 龙哥
# 2023年04月06日11时33分54秒
from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator

from .models import UserFav
from .models import UserLeavingMessage, UserAddress
from goods.serializers import GoodsSerializer


class UserFavSerializer(serializers.ModelSerializer):
    # 隐藏字段是不需要用户提交的，也不会显示，类似write_only
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()  # 自动拿当前用户
    )

    class Meta:
        model = UserFav
        validators = [
            UniqueTogetherValidator(
                queryset=UserFav.objects.all(),
                fields=('user', 'goods'),
                message="已经收藏"  # 违背了联合唯一，提示已经收藏
            )
        ]

        fields = ("user", "goods", "id")


class UserFavDetailSerializer(serializers.ModelSerializer):
    """
    用户查看个人收藏列表时使用这个序列化类
    """
    goods = GoodsSerializer()

    # 与UserFavSerializer差异在于我们的goods商品的详细信息
    class Meta:
        model = UserFav
        fields = ("goods", "id")


class LeavingMessageSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    #read_only的作用就是只返回，不提交，也就是post时不需要用户提交
    add_time = serializers.DateTimeField(read_only=True, format='%Y-%m-%d %H:%M')
    class Meta:
        model = UserLeavingMessage
        fields = ("user", "message_type", "subject", "message", "file", "id" ,"add_time")


class AddressSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    #format是前端看到的时间格式
    add_time = serializers.DateTimeField(read_only=True, format='%Y-%m-%d %H:%M')

    class Meta:
        model = UserAddress
        fields = ("id", "user", "province", "city", "district", "address",
                  "signer_name", "add_time", "signer_mobile")
