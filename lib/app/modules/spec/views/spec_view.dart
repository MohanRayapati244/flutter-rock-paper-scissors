import 'package:flutter/material.dart';

class SpecView extends StatelessWidget {
  const SpecView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3D Portfolio Spec')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          Text(
            'Goal',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Create a complete 3D animated portfolio website using React + Vite + React Three Fiber, Tailwind CSS, and Framer Motion/GSAP. Futuristic, clean, and visually striking.',
          ),
          SizedBox(height: 16),
          Text(
            'Features',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            '- Full-screen 3D background (R3F/Three.js)\n'
            '- Animated text and elements (Framer Motion/GSAP)\n'
            '- Responsive (desktop + mobile)\n'
            '- Hero with name, role (e.g., Flutter Developer), social icons\n'
            '- About Me + Projects with hover animations\n'
            '- Tailwind CSS styling (dark mode default)\n'
            '- Floating 3D object (cube/sphere/logo)\n'
            '- Gradient/particle background\n'
            '- Clean components: Header, HeroSection, Projects, Contact\n'
            '- Scroll-based animations (camera/model parallax)',
          ),
          SizedBox(height: 16),
          Text(
            'Technologies',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'React + Vite, React Three Fiber, Tailwind CSS, Framer Motion/GSAP',
          ),
          SizedBox(height: 16),
          Text(
            'Instructions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Generate full code structure with comments. Indicate where to add custom 3D models, text, and images.',
          ),
        ],
      ),
    );
  }
}
