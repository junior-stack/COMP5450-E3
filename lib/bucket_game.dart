import 'dart:math';
import 'package:demo/score_text.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'bucket.dart';
import 'ball.dart';

class BucketGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  late Bucket bucket;
  late ScoreText scoreText;
  double spawnTimer = 0.0;

  @override
  Future<void> onLoad() async {
    bucket = Bucket();
    add(bucket);

    // Add score text
    scoreText = ScoreText()
    ..position = Vector2(size.x - 10, 10);
    add(scoreText);
  }

  @override
  void update(double dt) {
    super.update(dt);
    spawnTimer += dt;
    if (spawnTimer > 1.0) {
      spawnTimer = 0.0;
      add(Ball());
    }
  }
}