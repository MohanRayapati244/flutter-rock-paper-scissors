import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class permanentController extends GetxController {
  var count = 0.obs;
  void increment(){count++;}
}

class lazyController extends GetxController{
  var count = 0.obs;
  void increment(){count++;}
}

class teansientController extends GetxController{
  var count = 0.obs;
  void increment(){
    count++;
  }
}