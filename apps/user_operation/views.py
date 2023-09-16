from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated

from .models import UserFav, UserLeavingMessage, UserAddress
from .serializers import UserFavSerializer, UserFavDetailSerializer, LeavingMessageSerializer, AddressSerializer
# Create your views here.
from .permissions import IsOwnerOrReadOnly


# CreateModelMixin是搞添加收藏，DestroyModelMixin是搞删除收藏


class UserFavViewset(mixins.ListModelMixin, mixins.CreateModelMixin,
                     mixins.RetrieveModelMixin,
                     mixins.DestroyModelMixin, viewsets.GenericViewSet):
    '''
    list:
        获取用户收藏列表
    retrieve:
        判断某个商品是否已经收藏
    create:
        收藏商品
    destroy:
        删除收藏
    '''

    serializer_class = UserFavSerializer  # 序列化类
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)  # 验证是否登录,登录才能看
    lookup_field = 'goods_id'  #使得详情页的url的id是goods_id
    def get_queryset(self):
        # 实现了每个用户只能看到自己收藏的内容
        return UserFav.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == "list":
            return UserFavDetailSerializer
        elif self.action == "create":
            return UserFavSerializer

        return UserFavSerializer

    #实现收藏某个商品对收藏数加1
    def perform_create(self, serializer):
        instance=serializer.save()
        goods = instance.goods
        goods.fav_num += 1#对收藏数加1
        goods.save()

    #实现某个商品取消收藏时减1
    def perform_destroy(self, instance):
        goods = instance.goods
        goods.fav_num -= 1  # 对收藏数加1
        goods.save()
        instance.delete()

class LeavingMessageViewset(mixins.ListModelMixin, mixins.DestroyModelMixin,
                            mixins.CreateModelMixin,viewsets.GenericViewSet):
    """
    list:
        获取用户留言
    create:
        添加留言
    delete:
        删除留言功能
    """

    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)

    serializer_class = LeavingMessageSerializer

    def get_queryset(self):
        return UserLeavingMessage.objects.filter(user=self.request.user)

class AddressViewset(viewsets.ModelViewSet):
    """
    收货地址管理
    list:
        获取收货地址
    create:
        添加收货地址
    update:
        更新收货地址
    delete:
        删除收货地址
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    serializer_class = AddressSerializer

    def get_queryset(self):#每一个用户只能查自己的地址
        return UserAddress.objects.filter(user=self.request.user)