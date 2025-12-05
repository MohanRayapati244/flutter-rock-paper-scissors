import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool showKidsOverlay = false.obs;

  final GetStorage storage = GetStorage();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final RegExp emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value.trim())) return 'Enter a valid email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Min 6 characters';
    return null;
  }

  Future<void> submit() async {
    final FormState? state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) return;

    isLoading.value = true;
    await Future<void>.delayed(const Duration(milliseconds: 300));
    storage.write('email', emailController.text.trim());
    isLoading.value = false;

    // Navigate to the color blast page with colorful animations
    Get.toNamed(AppRoutes.colorBlast);
  }

  Future<void> playKidsAndShowQuestionBox() async {
    showKidsOverlay.value = true;
    await Future<void>.delayed(const Duration(seconds: 3));
    showKidsOverlay.value = false;
    await Future<void>.delayed(const Duration(milliseconds: 150));
    showQuestionBox();
  }

  void showQuestionBox() {
    Get.dialog(
      Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0xFFFFDEE9),
                Color(0xFFDAD4FF),
                Color(0xFFB5FFFC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  "What's on your mind?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: const <Widget>[
                    _QuestionChip(label: 'Happy'),
                    _QuestionChip(label: 'Excited'),
                    _QuestionChip(label: 'Curious'),
                    _QuestionChip(label: 'Motivated'),
                  ],
                ),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Type here...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(onPressed: Get.back, child: const Text('Close')),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: Get.back,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierColor: Colors.black54,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

class _QuestionChip extends StatelessWidget {
  const _QuestionChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      side: const BorderSide(color: Color(0xFF7C4DFF)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
