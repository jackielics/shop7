from django.shortcuts import render

# Create your views here.
from django.shortcuts import render

# Create your views here.
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth import get_user_model
from django.db.models import Q
from rest_framework import viewsets
from rest_framework.mixins import CreateModelMixin, RetrieveModelMixin,UpdateModelMixin

User = get_user_model()


class CustomBackend(ModelBackend):
    """
    自定义用户验证
    """

    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = User.objects.get(Q(username=username) | Q(mobile=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


from .serializers import UserRegSerializer, UserDetailSerializer
from rest_framework_jwt.serializers import jwt_encode_handler, jwt_payload_handler
from rest_framework import permissions

class UserViewset(CreateModelMixin, RetrieveModelMixin,UpdateModelMixin,
                  viewsets.GenericViewSet):
    """
    现在只支持用户注册
    """
    queryset = User.objects.all()
    serializer_class = UserRegSerializer

    # 为什么这里要重写perform_create，
    # 因为CreateModelMixin中的perform_create没有return，
    # 尽量不修改源码，serializer.save()后返回的是模型类对象
    def perform_create(self, serializer):
        return serializer.save()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = self.perform_create(serializer)  # 返回拿到 user对象
        # 拿到serializer.data然后将name和token填写进去
        re_dict = serializer.data
        # 得到payload
        payload = jwt_payload_handler(user)
        # 这一步是加签
        re_dict["token"] = jwt_encode_handler(payload)
        # 因为登录时，给用户返回的是token，和name，那么注册并登录要遵守统一规范
        re_dict["name"] = user.name if user.name else user.username

        headers = self.get_success_headers(serializer.data)
        return Response(re_dict, status=status.HTTP_201_CREATED, headers=headers)

    #实现动态的序列化类
    def get_serializer_class(self):
        if self.action == "retrieve":
            return UserDetailSerializer
        elif self.action == "create":
            return UserRegSerializer

        return UserDetailSerializer

    #实现动态权限，注册时，用户还没有账户，自然不能验证权限
    def get_permissions(self):
        if self.action == "retrieve":
            return [permissions.IsAuthenticated()]
        elif self.action == "create":
            return []

        return [permissions.IsAuthenticated()]

    #详情页无论输入的id是几，给你自己的信息
    def get_object(self):
        return self.request.user

from rest_framework.response import Response
from rest_framework import status
from random import choice

from .serializers import SmsSerializer
from shop7.settings import APIKEY
from utils.yunpian import YunPian
from .models import VerifyCode


# 为什么要继承CreateModelMixin，因为我们要往数据库里存东西
class SmsCodeViewset(CreateModelMixin, viewsets.GenericViewSet):
    """
    发送短信验证码
    """
    # 设置序列化类
    serializer_class = SmsSerializer

    # 产生随机数
    def generate_code(self):
        """
        生成四位数字的验证码
        :return:
        """
        seeds = "1234567890"
        random_str = []
        for i in range(4):
            # choice可以用字符串中随机选一个字符出来
            random_str.append(choice(seeds))

        return "".join(random_str)

    # 重写CreateModelMixin的create方法
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        # 这里如果raise_exception设置为True，那么如果序列化过程中发生异常，那么会自动帮我们给客户端返回400异常，比较方便
        serializer.is_valid(raise_exception=True)
        # 拿到手机号
        mobile = serializer.validated_data["mobile"]
        # 初始化云片网对象
        yun_pian = YunPian(APIKEY)
        # 生产4位数字随机验证码
        code = self.generate_code()
        # 发送短信
        sms_status = yun_pian.send_sms(code=code, mobile=mobile)
        # 云片网的响应，返回0代表成功
        if sms_status["code"] != 0:
            # 不成功，把不成功原因返回给用户
            return Response({
                "mobile": sms_status["msg"]
            }, status=status.HTTP_400_BAD_REQUEST)
        else:
            # 保存验证码
            code_record = VerifyCode(code=code, mobile=mobile)
            code_record.save()
            return Response({
                "mobile": mobile
            }, status=status.HTTP_201_CREATED)
