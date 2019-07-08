from django.urls import path,include
from .views import *
from rest_framework import routers


router = routers.DefaultRouter()
router.register(r'service', DefaultNameSpacePods, base_name='default_namespace')
router.register(r'service/(?P<application_group>[^/.]+)', DefaultNameSpacePods, base_name='applicationGroup')

urlpatterns = [
    path('', include(router.urls))
]
