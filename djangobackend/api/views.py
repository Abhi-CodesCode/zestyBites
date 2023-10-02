from .models import FoodItem
from .serializers import FoodItemSerializer
from rest_framework.generics import ListAPIView

# Create your views here.

class FoodItemList(ListAPIView):
    queryset = FoodItem.objects.all()
    serializer_class=FoodItemSerializer
    