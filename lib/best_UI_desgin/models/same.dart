import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:colorful_login_getx/best_UI_desgin/models/firstmodel.dart';

class producController extends GetxController {
  var currentIndex = 0.obs;
  final products = [
    productModel(
      name: "Strawberry",
      image: "assests/images/yago.png",
      backgroundColor: "#ff0000",
      price: "4.99",
    ),
    productModel(
      name: "green Apple",
      image: "assests/images/greenyoga.png",
      backgroundColor: "#00f746",
      price: "4.99",
    ),
    productModel(
      name: "Promogranate",
      image: "assests/images/promo.png",
      backgroundColor: "#1c1317",
      price: "4.2"
    ),
  ];
}
