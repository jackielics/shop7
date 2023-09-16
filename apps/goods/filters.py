# 作者: 王道 龙哥
# 2023年04月04日15时15分44秒
from django.db.models import Q
from django_filters import rest_framework as filters
from .models import Goods


class GoodsFilter(filters.FilterSet):
    min_price = filters.NumberFilter(field_name="shop_price", lookup_expr='gte')
    max_price = filters.NumberFilter(field_name="shop_price", lookup_expr='lte')
    name =filters.CharFilter(field_name = "name",lookup_expr = 'icontains') #contains代表包含，i代表不区分大小写

    #top_category过滤是通过top_category_filter实现的过滤
    top_category = filters.NumberFilter(method='top_category_filter')

    #queryset是view视图中的queryset，value是top_category的值
    def top_category_filter(self, queryset, name, value):
        return queryset.filter(Q(category_id=value)|Q(category__parent_category_id=value)|Q(category__parent_category__parent_category_id=value))

    class Meta:
        model = Goods
        fields = ['min_price', 'max_price','name','is_hot','is_new']