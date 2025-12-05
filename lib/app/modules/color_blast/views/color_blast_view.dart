import 'dart:math' as math;

import 'package:flutter/material.dart';

class ColorBlastView extends StatefulWidget {
  const ColorBlastView({super.key});

  @override
  State<ColorBlastView> createState() => _ColorBlastViewState();
}

class _ColorBlastViewState extends State<ColorBlastView>
    with TickerProviderStateMixin {
  late final AnimationController gradientController;
  late final AnimationController particlesController;

  @override
  void initState() {
    super.initState();
    gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..repeat();
    particlesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    gradientController.dispose();
    particlesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _AnimatedRainbowBackground(controller: gradientController),
          _ParticlesLayer(controller: particlesController),
          // Spec button
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: _SpecButton(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.white),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            ),
          ),
          Center(child: _ColorfulBlob(controller: particlesController)),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('Back'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
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

class _SpecButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/spec');
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: <Color>[
              Color(0xFF00D1FF),
              Color(0xFF7C4DFF),
              Color(0xFFFF6F91),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.description_rounded, color: Colors.white),
              SizedBox(width: 6),
              Text(
                'Spec',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedRainbowBackground extends StatelessWidget {
  const _AnimatedRainbowBackground({required this.controller});
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        final double t = controller.value * 2 * math.pi;
        final Alignment begin = Alignment(math.cos(t), math.sin(t));
        final Alignment end = Alignment(-math.cos(t), -math.sin(t));
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: begin,
              end: end,
              colors: const <Color>[
                Color(0xFFFF5757),
                Color(0xFFFFA857),
                Color(0xFFFFFF57),
                Color(0xFF57FF57),
                Color(0xFF57FFFF),
                Color(0xFF5757FF),
                Color(0xFFFF57FF),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ParticlesLayer extends StatelessWidget {
  const _ParticlesLayer({required this.controller});
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        final double t = controller.value;
        final List<Widget> dots = <Widget>[];
        for (int i = 0; i < 60; i++) {
          final double angle = (i / 60.0) * 2 * math.pi + t * 2 * math.pi;
          final double radius =
              40 + 120 * (0.5 + 0.5 * math.sin(t * 2 * math.pi + i));
          final double x =
              0.5 +
              (radius / MediaQuery.of(context).size.width) * math.cos(angle);
          final double y =
              0.5 +
              (radius / MediaQuery.of(context).size.height) * math.sin(angle);
          dots.add(
            Positioned(
              left: x * MediaQuery.of(context).size.width,
              top: y * MediaQuery.of(context).size.height,
              child: Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.7),
                  shape: BoxShape.circle,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return IgnorePointer(child: Stack(children: dots));
      },
    );
  }
}

class _ColorfulBlob extends StatelessWidget {
  const _ColorfulBlob({required this.controller});
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        final double t = controller.value * 2 * math.pi;
        return Transform.scale(
          scale: 1.0 + 0.02 * math.sin(t * 2),
          child: CustomPaint(
            painter: _BlobPainter(t),
            size: const Size(280, 280),
          ),
        );
      },
    );
  }
}

class _BlobPainter extends CustomPainter {
  _BlobPainter(this.t);
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: <Color>[
          Color(0xFF00D1FF),
          Color(0xFF7C4DFF),
          Color(0xFFFF6F91),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path path = Path();
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double r = math.min(size.width, size.height) / 2 * 0.9;
    for (int i = 0; i <= 360; i += 5) {
      final double rad = i * math.pi / 180;
      final double noise =
          0.15 * math.sin(3 * rad + t) + 0.1 * math.sin(5 * rad - t);
      final double rr = r * (1.0 + noise);
      final double x = cx + rr * math.cos(rad);
      final double y = cy + rr * math.sin(rad);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawShadow(path, Colors.black54, 16, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BlobPainter oldDelegate) => oldDelegate.t != t;
}
