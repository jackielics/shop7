"""shop7 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path, include  # re_path支持正则表达式匹配的
from django.views.generic import TemplateView
from django.views.static import serve

from shop7.settings import MEDIA_ROOT

from rest_framework.routers import DefaultRouter
from goods.views import GoodsListViewSet, CategoryViewset, BannerViewset, IndexCategoryViewset
from trade.views import ShoppingCartViewset, OrderViewset, AlipayView
from users.views import UserViewset,SmsCodeViewset
from user_operation.views import UserFavViewset, LeavingMessageViewset, AddressViewset

router = DefaultRouter()
router.register(r'goods',GoodsListViewSet,basename='good')
router.register(r'categorys',CategoryViewset,basename='category')
router.register(r'users',UserViewset,basename='user')
router.register(r'codes', SmsCodeViewset, basename="code")
router.register(r'userfavs', UserFavViewset,basename='userfav')
#用户留言
router.register(r'messages', LeavingMessageViewset, basename="message")
#用户地址
router.register(r'address', AddressViewset, basename="address")
#购物车
router.register(r'shopcarts', ShoppingCartViewset, basename="shopcart")
#订单相关url
router.register(r'orders', OrderViewset, basename="order")
#轮播功能
router.register(r'banners', BannerViewset, basename="banner")
#首页商品系列数据
router.register(r'indexgoods', IndexCategoryViewset, basename="indexgood")

from rest_framework.authtoken import views
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework.documentation import include_docs_urls

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls')),
    re_path(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    path('', include(router.urls)),
    re_path(r'^api-token-auth/', views.obtain_auth_token),
    path('login/', obtain_jwt_token), #前端会把用户名和密码提交到login
    path('docs/', include_docs_urls(title="我的生鲜")),
    #支付成功后，阿里会访问这个url
    re_path(r'^alipay/return/', AlipayView.as_view(), name="alipay"),
    re_path(r'^index/', TemplateView.as_view(template_name="index.html"), name="index"),
    # 第三方登录
    re_path(r'', include('social_django.urls', namespace='social'))
]
