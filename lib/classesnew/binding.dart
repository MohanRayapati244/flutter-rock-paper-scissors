import 'package:colorful_login_getx/classesnew/update.dart';
import 'package:get/get.dart';

class homeBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<HomeupdatezController>(() => HomeupdatezController());
  }
}