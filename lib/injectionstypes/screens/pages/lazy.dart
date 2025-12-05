import 'package:colorful_login_getx/injectionstypes/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Lazy_Page extends StatelessWidget {
  const Lazy_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final lazyController controller = Get.find<lazyController>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
          () => Text(
            'Lazy count: ${controller.count}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        child: Icon(Icons.add, size: 20, color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
