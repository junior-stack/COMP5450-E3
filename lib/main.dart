import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'bucket_game.dart';

void main() {
  final game = BucketGame();
  runApp(Focus(
    autofocus: true,
    child: GameWidget(game: game),
  ),);
}