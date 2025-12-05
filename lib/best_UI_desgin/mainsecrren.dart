import 'package:colorful_login_getx/best_UI_desgin/apple.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:colorful_login_getx/best_UI_desgin/models/firstmodel.dart';
import 'package:colorful_login_getx/best_UI_desgin/models/same.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({super.key});

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> with SingleTickerProviderStateMixin {
  final producController controller = Get.put(producController());
  late AnimationController _animController;
  late Animation<double> _textAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _textAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final product = controller.products[controller.currentIndex.value];
        final bgColor = Color(int.parse("0xFF${product.backgroundColor.substring(1)}"));

        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: bgColor,
          child: PageView.builder(
            itemCount: controller.products.length,
            onPageChanged: (index) {
              controller.currentIndex.value = index;
              _animController.reset();
              _animController.forward();
            },
            itemBuilder: (context, index) {
              final item = controller.products[index];
              return SafeArea(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      
                      Container(color: bgColor),

                   
                      Positioned(
                        top: 150,
                        child: Image.asset(
                          item.image,
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                      ),

                      
                      Positioned(
                        top: 300,
                        right: 40,
                        child: AnimatedTextWidget(
                          text: "A Wonder",
                          animation: _textAnim,
                          fromLeft: false,
                        ),
                      ),

                     
                      Positioned(
                        bottom: 260,
                        left: 40,
                        child: AnimatedTextWidget(
                          text: "Taste Like",
                          animation: _textAnim,
                          fromLeft: true,
                        ),
                      ),

                      // ✅ Product price below everything
                      Positioned(
                        bottom: 60,
                        child: FadeTransition(
                          opacity: _textAnim,
                          child: Text(
                            "\$4.99",
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

// class HomeworkScreen extends StatefulWidget {
//   const HomeworkScreen({Key? key}) : super(key: key);
//   @override
//   State<HomeworkScreen> createState() => _HomeworkScreenState();
// }

// class _HomeworkScreenState extends State<HomeworkScreen>
//     with TickerProviderStateMixin {
//   final producController controller = Get.put(producController());
//   late AnimationController _animController;
//   late Animation<double> _textAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//     _textAnimation = CurvedAnimation(
//       parent: _animController,
//       curve: Curves.easeOutBack,
//     );
//     _animController.forward();
//   }

//   @override
//   void dispose() {
//     _animController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     PageController pageController = PageController();

//     return Scaffold(
//       body: Obx(() {
//         final product = controller.products[controller.currentIndex.value];
//         final bgColor = Color(
//           int.parse("0xFF${product.backgroundColor.substring(1)}"),
//         );

//         return AnimatedContainer(
//           duration: Duration(milliseconds: 1000),
//           color: bgColor,
//           child: PageView.builder(
//             controller: pageController,
//             scrollDirection: Axis.horizontal,
//             onPageChanged: (index) {
//               controller.currentIndex.value = index;
//               _animController.reset();
//               _animController.forward();
//             },
//             itemCount: controller.products.length,
//             itemBuilder: (context, index) {
//               final item = controller.products[index];
//               // final animation = _textAnimation;
//               // (
//               //   controller.currentIndex.value == index ? 1.0 : 0.0,
//               // );

//               return SafeArea(
//                 child: Center(
//                   child: SingleChildScrollView(
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(color: bgColor,),
//                         Positioned(
//                           top: 150,
//                           child: Image.asset(
//                             item.image,
//                             height: 300,
//                            // fit: BoxFit.contain,
//                           ),
//                         ),
//                         Positioned(
//                           top:100,
//                           right: 40,
                          
//                           child: Apple_State(
//                             text: "Taste Like",
//                             animation: _textAnimation,
//                             //fromTop: true,
//                             fromleft: false,
//                           ),
//                         ),

//                         //Apple_State(text: "Straberry", animation: _textAnimation, fromTop: true),
//                         //SizedBox(height: 20),
//                        // Image.asset(item.image, height: 300),
//                        // SizedBox(height: 20),
//                         Positioned(
//                           bottom: 150,
//                           left: 40,
//                           child: Apple_State(
//                             text: "a Wonder",
//                             animation: _textAnimation,
//                             fromleft: true,
//                           ),
//                         ),
//                         //Apple_State(text: "Price:", animation: _textAnimation, fromTop: false),
//                        // SizedBox(height: 30),
//                         Positioned(
//                           top: 30,
                          
//                           child: Apple_State(
//                             text: "Straberry",
//                             animation: _textAnimation,
//                             fromTop: true,
//                           ),
//                         ),
//                        // SizedBox(height: 20),
//                         Positioned(
//                           bottom: 30,
//                           child: Apple_State(
//                             text: "Price",
//                             animation: _textAnimation,
//                             fromleft: true,
//                           ),
//                         ),
//                        // SizedBox(height: 30),
//                         Positioned(
//                           bottom: 60,
//                           child: FadeTransition(
//                             opacity: _textAnimation,
//                             child: Text(
//                               "\$${item.price}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }),
//     );
//   }
// }
