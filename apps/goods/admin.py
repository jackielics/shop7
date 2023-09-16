from django.contrib import admin

# Register your models here.
from django.contrib.admin.options import InlineModelAdmin

from .models import Goods, GoodsCategory, GoodsImage, GoodsCategoryBrand, Banner, HotSearchWords
from .models import IndexAd

class GoodsAdmin(admin.ModelAdmin):
    list_display = ["name", "click_num", "sold_num", "fav_num", "goods_num", "market_price",
                    "shop_price", "goods_brief", "goods_desc", "is_new", "is_hot", "add_time"]
    search_fields = ['name', ]
    list_editable = ["is_hot", 'is_new']
    list_filter = ["name", "click_num", "sold_num", "fav_num", "goods_num", "market_price",
                   "shop_price", "is_new", "is_hot", "add_time", "category__name"]
    style_fields = {"goods_desc": "ueditor"}
    list_per_page = 5
    # class GoodsImagesInline(InlineModelAdmin):
    #     model = GoodsImage
    #     exclude = ["add_time"]
    #     extra = 1
    #     style = 'tab'
    class GoodsImagesInline(admin.StackedInline):
        # 写多类的名字
        model = GoodsImage
        extra = 2  #下面新增位置显示数目，默认显示3个

    inlines = [GoodsImagesInline]

class GoodsCategoryAdmin(admin.ModelAdmin):
    list_display = ["name", "category_type", "parent_category", "add_time",'is_tab']
    list_editable =['is_tab',]
    list_filter = ["category_type", "parent_category", "name"]
    search_fields = ['name', ]
    list_per_page = 5

class BannerGoodsAdmin(admin.ModelAdmin):
    list_display = ["goods", "image", "index"]

#品牌广告配置
class GoodsBrandAdmin(admin.ModelAdmin):
    list_display = ["category", "image", "name", "desc"]

    def get_context(self):
        context = super(GoodsBrandAdmin, self).get_context()
        if 'form' in context:
            context['form'].fields['category'].queryset = GoodsCategory.objects.filter(category_type=1)
        return context

class IndexAdAdmin(admin.ModelAdmin):
    list_display = ["category", "goods"]

admin.site.register(Goods, GoodsAdmin)
admin.site.register(GoodsCategory,GoodsCategoryAdmin)
admin.site.register(Banner,BannerGoodsAdmin)
admin.site.register(GoodsCategoryBrand, GoodsBrandAdmin)
admin.site.register(IndexAd, IndexAdAdmin)