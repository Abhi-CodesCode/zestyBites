from django.urls import path
from api import views

urlpatterns = [
    path('fooditem/',views.FoodItemList.as_view()),
]
