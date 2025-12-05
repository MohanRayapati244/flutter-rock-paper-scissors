import 'package:get/get.dart';

class Productcontroller extends GetxController{ 
  var products = <String>[].obs;

  @override
  void onInit(){
    super.onInit();
     print("🟢 ProductController → onInit called");
     fetchproducts();
  }
  void fetchproducts()async{await Future.delayed(Duration(seconds: 3));
  products.value = [
    "Mango Juice",
      "Apple Shake",
      "Banana Smoothie",
      "Strawberry Milk",
      "Lemon Soda"

  ] ;

  
  }
  void addproduct(String newItem){
    products.add(newItem);
  }
  @override
  void onClose(){
    super.onClose();
    print("🔴 ProductController → onClose called");
  }
}
