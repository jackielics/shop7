from django.contrib import admin

# Register your models here.
from django.contrib.admin.options import InlineModelAdmin

from .models import ShoppingCart, OrderInfo, OrderGoods
class ShoppingCartAdmin(admin.ModelAdmin):
    list_display = ["user", "goods", "nums", ]


class OrderInfoAdmin(admin.ModelAdmin):
    list_display = ["user", "order_sn",  "trade_no", "pay_status", "post_script", "order_mount",
                    "order_mount", "pay_time", "add_time"]

    # class OrderGoodsInline(InlineModelAdmin):
    #     model = OrderGoods
    #     exclude = ['add_time', ]
    #     extra = 1
    #     style = 'tab'
    #
    # inlines = [OrderGoodsInline, ]
    class OrderGoodsInline(admin.StackedInline):
        # 写多类的名字
        model = OrderGoods
        extra = 2  #下面新增位置显示数目，默认显示3个
    inlines = [OrderGoodsInline]  #以块的形式

admin.site.register(ShoppingCart, ShoppingCartAdmin)
admin.site.register(OrderInfo, OrderInfoAdmin)