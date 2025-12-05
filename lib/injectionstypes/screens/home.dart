import 'package:colorful_login_getx/injectionstypes/screens/pages/lazy.dart';
import 'package:colorful_login_getx/injectionstypes/screens/pages/permenet.dart';
import 'package:colorful_login_getx/injectionstypes/screens/pages/transient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.to(()=>  Permenent_Page());
            }, child: Text("Permanent Controller") ),
            ElevatedButton(onPressed: (){
              Get.to(() => Lazy_Page());
            }, child: Text("Lazy Controller") ),
            ElevatedButton(onPressed: (){
              Get.to(() => Transient());
            }, child: Text("Transient Controller") ),
          ],

        ),
      ) ,
    );
  }
}