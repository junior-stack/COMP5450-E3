import 'package:demo/bucket_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;


class Bucket extends SpriteComponent
    with HasGameReference<BucketGame>, KeyboardHandler, DragCallbacks {

  double moveSpeed = 300;
  bool moveLeft = false;
  bool moveRight = false;

  Bucket() : super(size: Vector2(100, 100));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('bucket.png');
    position = Vector2(game.size.x / 2 - size.x / 2, game.size.y - 120);
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (kIsWeb) {
      if (moveLeft) {
        position.x -= moveSpeed * dt;
      } else if (moveRight) {
        position.x += moveSpeed * dt;
      }
    }

    position.clamp(Vector2.zero(), game.size - size);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (kIsWeb) {
      moveLeft = keysPressed.contains(LogicalKeyboardKey.arrowLeft);
      moveRight = keysPressed.contains(LogicalKeyboardKey.arrowRight);
    }
    return true; // Event handled
  }

  @override
  void onDragUpdate(DragUpdateEvent event){
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      position.x += event.localDelta.x;
      position.clamp(Vector2.zero(), game.size - size);
    }
  }
}
