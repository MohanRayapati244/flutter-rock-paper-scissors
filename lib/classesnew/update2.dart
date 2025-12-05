import 'package:colorful_login_getx/classesnew/update.dart';
import 'package:colorful_login_getx/services/Ai/gemini_services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeqScreen extends StatefulWidget {
  const HomeqScreen({super.key});

  @override
  State<HomeqScreen> createState() => _HomeqScreenState();
}

class _HomeqScreenState extends State<HomeqScreen>
    with TickerProviderStateMixin {
  final HomeupdatezController controller = Get.put(HomeupdatezController());
  late final GeminiService gemini;
  String aiText = "";
  bool isInitialized = false;
  bool isGenerating = false;

  @override
  void initState() {
    super.initState();
    // GeminiService constructor is synchronous; instantiate here
    gemini = GeminiService();
    isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.backgroundColor.value,
  floatingActionButton: FloatingActionButton(
          onPressed: (!isInitialized || isGenerating)
              ? null
              : () async {
                  final fruitName = controller.currentIndex.value == 0
                      ? 'Strawberry'
                      : controller.currentIndex.value == 1
                          ? 'Kiwi'
                          : 'Orange';

                  setState(() {
                    aiText = '✨ Generating fun fact...';
                    isGenerating = true;
                  });

                  final result = await gemini.generateText(
                    "Give a short, fun fact about $fruitName fruit with an emoji.",
                  );

                  setState(() {
                    aiText = result;
                    isGenerating = false;
                  });
                },
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: isGenerating
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2,
                  ),
                )
              : const Icon(
                  Icons.auto_awesome,
                  color: Colors.blueAccent,
                ),
        ),
        body: Stack(
          children: [
            PageView.builder(
              onPageChanged: controller.onPageChanged,
              itemCount: controller.bottleImages.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    ...List.generate(
                      controller.fruitsforbottles[index].length,
                      (i) => SlideTransition(
                        position: controller
                            .fruitAnimations[i % controller.fruitAnimations.length],
                        child: Align(
                          alignment: Alignment(
                            (i.isEven ? -0.5 : 0.4),
                            -0.4 + (i * 0.2),
                          ),
                          child: Image.asset(
                            controller.fruitsforbottles[index][i],
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Hero(
                        tag: "bottle_$index",
                        child: Image.asset(
                          controller.bottleImages[index],
                          height: 260,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Text(
                  aiText.isEmpty
                      ? "Tap ✨ to get a fun fruit fact!"
                      : aiText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 3.0,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
