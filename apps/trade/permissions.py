# 作者: 王道 龙哥
# 2023年03月30日10时14分28秒
from rest_framework import permissions

#实现的是luke不可以改admin，admin不可以改luke的
class IsOwnerOrReadOnly(permissions.BasePermission):
    """
    Custom permission to only allow owners of an object to edit it.
    """

    def has_object_permission(self, request, view, obj):
        # Read permissions are allowed to any request,
        # so we'll always allow GET, HEAD or OPTIONS requests.
        #是查询就返回True
        if request.method in permissions.SAFE_METHODS:
            return True

        # Write permissions are only allowed to the owner of the snippet.
        #request.user是登录用户
        return obj.user == request.user