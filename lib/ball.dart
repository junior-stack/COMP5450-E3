import 'package:demo/bucket_game.dart';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'dart:math';
import 'bucket.dart';

class Ball extends SpriteComponent with HasGameReference<BucketGame>, CollisionCallbacks {
  Ball() : super(size: Vector2.all(30));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('ball.png');
    position = Vector2(Random().nextDouble() * game.size.x, 0);
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += 200 * dt;
    if (position.y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    if (other is Bucket) {
      game.scoreText.updateScore(1);
      removeFromParent();
    }
  }
}