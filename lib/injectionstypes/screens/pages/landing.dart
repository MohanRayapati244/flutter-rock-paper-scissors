import 'package:flutter/material.dart';

/// A simple responsive landing page inspired by the ChronoTask shot.
///
/// Usage: Navigate to `ChronoLandingPage()` from your app (e.g. push route
/// or set as home in `MaterialApp`). This file intentionally uses only core
/// Flutter widgets so it works without extra packages.
class ChronoLandingPage extends StatelessWidget {
  const ChronoLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0F172A), Color(0xFF0F2548)],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNav(context),
              const SizedBox(height: 32),
              LayoutBuilder(builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 900;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: isNarrow ? 12 : 24),
                  child: isNarrow ? _buildHeroColumn(context) : _buildHeroRow(context),
                );
              }),
              const SizedBox(height: 36),
              _buildFeaturesGrid(context),
              const SizedBox(height: 40),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: const [
          _Logo(),
          SizedBox(width: 12),
          Text('ChronoTask', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
        ]),
        // simple nav - collapses visually on small screens by using fewer items
        Row(children: [
          TextButton(onPressed: () {}, child: const Text('Features', style: TextStyle(color: Colors.white70))),
          TextButton(onPressed: () {}, child: const Text('Pricing', style: TextStyle(color: Colors.white70))),
          const SizedBox(width: 8),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C4DFF)), child: const Text('Get Started')),
        ])
      ],
    );
  }

  Widget _buildHeroRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 6),
              Text('A beautiful way to manage your time',
                  style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold, height: 1.05)),
              SizedBox(height: 18),
              Text('ChronoTask helps you plan, track and complete tasks with delightful animations and clear priorities.',
                  style: TextStyle(color: Colors.white70, fontSize: 16)),
              SizedBox(height: 22),
              _HeroButtons(),
            ],
          ),
        ),
        const SizedBox(width: 28),
        Expanded(
          flex: 4,
          child: _MockupCard(),
        ),
      ],
    );
  }

  Widget _buildHeroColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 6),
        Text('A beautiful way to manage your time', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, height: 1.05)),
        SizedBox(height: 14),
        Text('ChronoTask helps you plan, track and complete tasks with delightful animations and clear priorities.',
            style: TextStyle(color: Colors.white70, fontSize: 15)),
        SizedBox(height: 18),
        _HeroButtons(),
        SizedBox(height: 22),
        _MockupCard(),
      ],
    );
  }

  Widget _buildFeaturesGrid(BuildContext context) {
    final items = [
      _FeatureItem(icon: Icons.check_circle_outline, title: 'Track progress', subtitle: 'Visual timelines and stats.'),
      _FeatureItem(icon: Icons.access_time, title: 'Smart scheduling', subtitle: 'Auto-prioritize tasks.'),
      _FeatureItem(icon: Icons.palette_outlined, title: 'Custom themes', subtitle: 'Make it yours.'),
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final crossAxis = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxis, crossAxisSpacing: 18, mainAxisSpacing: 18, childAspectRatio: 3),
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
      );
    });
  }

  Widget _buildFooter(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
      Divider(color: Colors.white12),
      SizedBox(height: 12),
      Text('© 2025 ChronoTask — Crafted with care', style: TextStyle(color: Colors.white54)),
    ]);
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xFF7C4DFF), Color(0xFF4F7BFF)])),
      child: const Center(child: Icon(Icons.timer, color: Colors.white, size: 18)),
    );
  }
}

class _HeroButtons extends StatelessWidget {
  const _HeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C4DFF), padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14)), child: const Text('Get started')),
      const SizedBox(width: 12),
      OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(foregroundColor: Colors.white), child: const Text('How it works')),
    ]);
  }
}

class _MockupCard extends StatelessWidget {
  const _MockupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(colors: [Color(0xFF1F2937), Color(0xFF0B1220)]),
          boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 24, offset: Offset(0, 8))],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Expanded(child: Center(child: FlutterLogo(size: 80))),
          SizedBox(height: 12),
          Text('Project • Today', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text('Design landing page', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureItem({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFF0B1220), borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: const Color(0xFF7C4DFF), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: Colors.white, size: 20)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)), SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13))])),
      ]),
    );
  }
}
