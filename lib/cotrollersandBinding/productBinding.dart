import 'package:colorful_login_getx/best_UI_desgin/models/same.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'productcontroller.dart';
 class ProductBiiinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<Productcontroller>(() => Productcontroller());
  }

}