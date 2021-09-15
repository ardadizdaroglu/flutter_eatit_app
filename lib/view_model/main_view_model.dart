import 'package:flutter_eatit_app/model/restaurant_model.dart';

abstract class MainViewModel{
  Future<List<RestaurantModel>> displayRestaurantList();
}