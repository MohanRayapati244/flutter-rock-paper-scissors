import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeupdatezController extends GetxController with GetSingleTickerProviderStateMixin {
  /// -----------------------------
  /// 🧭 Reactive variables (obs)
  /// -----------------------------
  
  // current index of the image (like current bottle page)
  var currentIndex = 0.obs;

  // list of images or bottles
  final bottleImages = [
    "assests/images/yago.png",
    "assests/images/greenyoga.png",
    "assests/images/promo.png",
  ];
  final fruitsforbottles = [
    [
      "assests/images/straberry.png",
      "assests/images/straberry.png",
      "assests/images/straberry.png",
      "assests/images/straberry.png",
      "assests/images/straberry.png",
    ],
    [
      "assests/images/green.png",
      "assests/images/green3.png",
      "assests/images/green2.png",
      "assests/images/green2.png",
      "assests/images/green.png",
    ],
    [
      "assests/images/Orange2.png",
      "assests/images/Orange.png",
      "assests/images/Orange.png",
      "assests/images/Orange2.png",
      "assests/images/Orange2.png",
    ],
  ];

  var backgroundColor = Colors.white.obs;

  // 🎬 Fruit animation controllers and offsets
  late AnimationController fruitAnimationController;
  late List<Animation<Offset>> fruitAnimations;

  /// -----------------------------
  /// 🔄 Lifecycle
  /// -----------------------------
  @override
  void onInit() {
    super.onInit();
    _initFruitAnimations();
  }

  @override
  void onClose() {
    fruitAnimationController.dispose();
    super.onClose();
  }

  /// -----------------------------
  /// ⚙️ Functions
  /// -----------------------------

  void onPageChanged(int index) {
    currentIndex.value = index;
    updateBackground(index);
    triggerFruitAnimations(index);
  }

  void updateBackground(int index) {
    switch (index) {
      case 0:
        backgroundColor.value = Colors.redAccent.shade700;
        break;
      case 1:
        backgroundColor.value = const Color.fromARGB(255, 142, 222, 82);
        break;
      case 2:
        backgroundColor.value = const Color.fromARGB(255, 0, 0, 0);
        break;
      default:
        backgroundColor.value = Colors.white;
    }
  }

  /// -----------------------------
  /// 🍎 Fruit Animation Setup
  /// -----------------------------
  void _initFruitAnimations() {
    fruitAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:1000),
    );

    fruitAnimations = List.generate(fruitsforbottles[currentIndex.value].length, (i) {
      final beginOffset = (i % 2 == 0)
          ? const Offset(-5, 0) // left to right
          : const Offset(5, 0); // right to left

      return Tween<Offset>(
        begin: beginOffset,
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: fruitAnimationController,
          curve: Interval(0.1 * i, 1.0, curve: Curves.easeOutBack),
        ),
      );
    });

    fruitAnimationController.forward();
  }

  void triggerFruitAnimations(int index) {
    fruitAnimationController.reset();
    fruitAnimationController.forward();
  }
}