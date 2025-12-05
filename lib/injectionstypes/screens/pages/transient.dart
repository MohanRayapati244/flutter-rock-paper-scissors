import 'package:colorful_login_getx/injectionstypes/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Transient extends StatelessWidget {
  const Transient({super.key});

  @override
  Widget build(BuildContext context) {
    final teansientController controller = Get.find<teansientController>();
    return Scaffold(
      appBar: AppBar(),
    
    body: Center(
      child: Obx(() => Text('Transient count:${controller.count}',
          style: TextStyle(fontSize: 20))),
    ),
    floatingActionButton: FloatingActionButton(onPressed: () => controller.increment(),
      child: Icon(Icons.add, size: 20, color: Colors.white),
      backgroundColor: Colors.black,
      elevation: 0,
    ),
    );
  }
}