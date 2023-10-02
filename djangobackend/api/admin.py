from django.contrib import admin
from .models import FoodItem
# Register your models here.

@admin.register(FoodItem)
class FoodItemAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'description', 'price','rating','distance','time','cost_per_person','comment_count']
