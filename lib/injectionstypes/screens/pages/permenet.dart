import 'package:colorful_login_getx/injectionstypes/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:colorful_login_getx/injectionstypes/screens/pages/permanent_details_screen.dart';

class Permenent_Page extends StatelessWidget {
  const Permenent_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final permanentController controller = Get.find<permanentController>();
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            'Permanent count:${controller.count}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => PermanentDetailsScreen());
        },
        child: Icon(Icons.arrow_forward, size: 20, color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
