import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/services.dart';

class Bucket extends SpriteComponent
    with HasGameRef, KeyboardHandler {
  double moveSpeed = 300;
  bool moveLeft = false;
  bool moveRight = false;

  Bucket() : super(size: Vector2(100, 100));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('bucket.png');
    position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y - 120);
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (moveLeft) {
      position.x -= moveSpeed * dt;
    } else if (moveRight) {
      position.x += moveSpeed * dt;
    }

    position.clamp(Vector2.zero(), gameRef.size - size);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    moveLeft = keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    moveRight = keysPressed.contains(LogicalKeyboardKey.arrowRight);
    return true; // Event handled
  }
}
