import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_eatit_app/const/const.dart';
import 'package:flutter_eatit_app/model/restaurant_model.dart';

Future<List<RestaurantModel>> getRestaurantList() async {
  var list = List<RestaurantModel>.empty(growable: true);
  var source =
      await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).once();
  Map<dynamic,dynamic> values = source.value;
  values.forEach((key, value) {
    list.add(RestaurantModel.fromJson(jsonDecode(jsonEncode(value))));
  });
  return list;
}
