import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'bucket_game.dart';

void main() {
  final game = BucketGame();
  runApp(Focus(
    autofocus: true,
    child: GameWidget(
        game: game,
        overlayBuilderMap: {
            'StartOverlay': (context, game) => Center(
              child: ElevatedButton(onPressed: () => (game as BucketGame).startGame(), child: const Text('Start Game')),
            ),
            'ResetButtonOverlay': (context, game) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () => (game as BucketGame).resetGame(),
                    child: const Text('Restart'),
                  ),
                ),
              ),
            ),
        },
    ),
  ),);
}