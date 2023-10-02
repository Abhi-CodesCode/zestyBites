from rest_framework import serializers
from .models import FoodItem

class FoodItemSerializer(serializers.ModelSerializer):
    class Meta:
        model=FoodItem
        fields=['id','title','description','price','rating','distance','time','cost_per_person','comment_count','image']