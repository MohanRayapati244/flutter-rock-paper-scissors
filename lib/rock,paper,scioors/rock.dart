import 'dart:math';
import 'package:flutter/material.dart';

enum Move { rock, paper, scissors }

void main() {
  runApp(const RockPaperScissorsApp());
}

class RockPaperScissorsApp extends StatelessWidget {
  const RockPaperScissorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
     // home: const GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Random _rng = Random();
  Move? _playerMove;
  Move? _aiMove;
  String _resultText = 'Make your move!';
  int _playerScore = 0;
  int _aiScore = 0;

  // Helper: display-friendly text + emoji
  String moveLabel(Move? m) {
    if (m == null) return '—';
    switch (m) {
      case Move.rock:
        return 'Rock 🪨';
      case Move.paper:
        return 'Paper 📄';
      case Move.scissors:
        return 'Scissors ✂️';
    }
  }

  void _play(Move playerChoice) {
    final aiChoice = Move.values[_rng.nextInt(3)];
    final result = _decideWinner(playerChoice, aiChoice);

    setState(() {
      _playerMove = playerChoice;
      _aiMove = aiChoice;
      if (result == 0) {
        _resultText = "It's a Draw!";
      } else if (result == 1) {
        _resultText = "You Win!";
        _playerScore++;
      } else {
        _resultText = "You Lose!";
        _aiScore++;
      }
    });
  }

  /// Returns: 0 = draw, 1 = player wins, -1 = ai wins
  int _decideWinner(Move player, Move ai) {
    if (player == ai) return 0;
    if ((player == Move.rock && ai == Move.scissors) ||
        (player == Move.paper && ai == Move.rock) ||
        (player == Move.scissors && ai == Move.paper)) {
      return 1;
    }
    return -1;
  }

  void _resetScores() {
    setState(() {
      _playerScore = 0;
      _aiScore = 0;
      _playerMove = null;
      _aiMove = null;
      _resultText = 'Make your move!';
    });
  }

  Widget _buildMoveButton(Move move, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          onPressed: () => _play(move),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: const TextStyle(fontSize: 28)),
              const SizedBox(height: 6),
              Text(move.name.toUpperCase(), style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock • Paper • Scissors'),
        actions: [
          IconButton(
            tooltip: 'Reset scores',
            onPressed: _resetScores,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Scoreboard
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text('You', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text('$_playerScore', style: theme.textTheme.headlineSmall),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Result', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(_resultText, style: theme.textTheme.titleMedium),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('AI', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text('$_aiScore', style: theme.textTheme.headlineSmall),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Choices display
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text('You chose', style: TextStyle(fontSize: 12)),
                        const SizedBox(height: 8),
                        Text(moveLabel(_playerMove), style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const VerticalDivider(width: 24, thickness: 1),
                    Column(
                      children: [
                        const Text('AI chose', style: TextStyle(fontSize: 12)),
                        const SizedBox(height: 8),
                        Text(moveLabel(_aiMove), style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Buttons
            Row(
              children: [
                _buildMoveButton(Move.rock, '🪨'),
                _buildMoveButton(Move.paper, '📄'),
                _buildMoveButton(Move.scissors, '✂️'),
              ],
            ),

            const SizedBox(height: 18),

            Text(
              'Tap an icon to play. Press refresh to reset scores.',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
