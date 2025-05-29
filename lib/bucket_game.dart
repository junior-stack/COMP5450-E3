import 'package:demo/score_text.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'bucket.dart';
import 'ball.dart';

enum GameState {menu, playing, gameOver}

class BucketGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  GameState gameState = GameState.menu;

  late Bucket bucket;
  late ScoreText scoreText;
  double spawnTimer = 0.0;

  final List<Component> gameObjects = [];

  @override
  Color backgroundColor() => Colors.blue;

  @override
  Future<void> onLoad() async {
    overlays.add('StartOverlay');
  }

  void startGame() {
    gameState = GameState.playing;
    overlays.remove('StartOverlay');
    overlays.add('ResetButtonOverlay');

    bucket = Bucket();
    add(bucket);

    scoreText = ScoreText()
      ..position = Vector2(size.x - 10, 30);
    add(scoreText);

    gameObjects.addAll([bucket, scoreText]);
  }

  void resetGame() {
    for(final obj in gameObjects){
      obj.removeFromParent();
    }
    gameObjects.clear();
    gameState = GameState.menu;
    overlays.remove('GameOverOverlay');
    overlays.add('StartOverlay');
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(gameState == GameState.playing){
      spawnTimer += dt;
      if (spawnTimer > 1.0) {
        spawnTimer = 0.0;
        add(Ball());
      }

    }
  }
}