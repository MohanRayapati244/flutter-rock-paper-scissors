import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Animated gradient background
          const _AnimatedGradientBackground(),

          // Kids running overlay
          Obx(() {
            final bool visible = controller.showKidsOverlay.value;
            if (!visible) return const SizedBox.shrink();
            return const _KidsRunningOverlay();
          }),

          // Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Card(
                  elevation: 18,
                  shadowColor: Colors.black.withValues(alpha: 0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const _LogoAndTitle(),
                          const SizedBox(height: 16),
                          Text(
                            'Welcome back! Please sign in',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email_rounded),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            validator: controller.validateEmail,
                          ),
                          const SizedBox(height: 16),
                          Obx(
                            () => TextFormField(
                              controller: controller.passwordController,
                              obscureText: !controller.isPasswordVisible.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock_rounded),
                                suffixIcon: IconButton(
                                  onPressed:
                                      controller.togglePasswordVisibility,
                                  icon: Icon(
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              validator: controller.validatePassword,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Forgot password?'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(
                            () => ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : controller.submit,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                backgroundColor: const Color(0xFF7C4DFF),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: controller.isLoading.value
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Create one'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoAndTitle extends StatelessWidget {
  const _LogoAndTitle();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: <Widget>[
        Container(
          height: 74,
          width: 74,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: <Color>[Color(0xFFFF6F91), Color(0xFF7C4DFF)],
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 36),
        ),
        const SizedBox(height: 12),
        Text(
          'Colorful Login',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _AnimatedGradientBackground extends StatefulWidget {
  const _AnimatedGradientBackground();

  @override
  State<_AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _KidsRunningOverlay extends StatefulWidget {
  const _KidsRunningOverlay();

  @override
  State<_KidsRunningOverlay> createState() => _KidsRunningOverlayState();
}

class _KidsRunningOverlayState extends State<_KidsRunningOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            final double t = Curves.easeInOut.transform(controller.value);
            return Stack(
              children: <Widget>[
                _runner(t, 0.00, Colors.orangeAccent),
                _runner(t, 0.15, Colors.pinkAccent),
                _runner(t, 0.30, Colors.lightBlueAccent),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _runner(double t, double delay, Color color) {
    final double local = (t - delay).clamp(0.0, 1.0);
    final double x =
        -0.2 + 1.4 * local; // from left off-screen to right off-screen
    final double y = 0.65 - 0.1 * math.sin(local * math.pi * 2);
    final double scale = 0.9 + 0.1 * math.sin(local * math.pi * 4);
    final double opacity = (local <= 0 || local >= 1) ? 0 : 1;

    return Align(
      alignment: Alignment(y, x),
      child: Opacity(
        opacity: opacity,
        child: Transform.scale(scale: scale, child: _kidIcon(color)),
      ),
    );
  }

  Widget _kidIcon(Color color) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.9),
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: color.withValues(alpha: 0.5),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(Icons.directions_run_rounded, color: Colors.white),
    );
  }
}

class _AnimatedGradientBackgroundState
    extends State<_AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        final double t = controller.value * 2 * math.pi;
        final Alignment begin = Alignment(math.cos(t) * 0.6, math.sin(t) * 0.6);
        final Alignment end = Alignment(-math.cos(t) * 0.6, -math.sin(t) * 0.6);
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: begin,
              end: end,
              colors: const <Color>[
                Color(0xFFFFDEE9), // pink tint
                Color(0xFFB5FFFC), // aqua tint
                Color(0xFFDAD4FF), // lavender tint
                Color(0xFFFFE29A), // warm accent
              ],
              stops: const <double>[0.0, 0.35, 0.7, 1.0],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.white.withValues(alpha: 0.0),
                  Colors.white.withValues(alpha: 0.05),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
