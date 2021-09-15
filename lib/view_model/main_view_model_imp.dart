import 'package:flutter_eatit_app/firebase/restaurant_reference.dart';
import 'package:flutter_eatit_app/model/restaurant_model.dart';
import 'package:flutter_eatit_app/view_model/main_view_model.dart';

class MainViewModelImp implements MainViewModel{
  @override
  Future<List<RestaurantModel>> displayRestaurantList() {
    return getRestaurantList();
  }

}