import 'package:colorful_login_getx/cotrollersandBinding/productcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Controllerhome extends StatelessWidget {
  const Controllerhome({super.key});

  @override
  Widget build(BuildContext context) {
    final Productcontroller controller = Get.find<Productcontroller>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx((){
        if(controller.products.isEmpty){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return ListView.builder(
            itemCount: controller.products.length,
            
            itemBuilder:(context, index){
              return ListTile(
                title: Text(controller.products[index]),
              );
            } );
        }

      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        controller.addproduct("New Product ${controller.products.length+1}");
      },
       child: const Icon(Icons.add),
      ),
    );
  }
}