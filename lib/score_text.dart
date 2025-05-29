import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';

class ScoreText extends TextComponent {
  int score = 0;

  ScoreText()
      : super(
    text: 'Score: 0',
    position: Vector2.zero(),
    anchor: Anchor.topRight,
    textRenderer: TextPaint(
      style: TextStyle(
        color: BasicPalette.white.color,
        fontSize: 24,
      ),
    ),
  );

  void updateScore(int value) {
    score += value;
    text = 'Score: $score';
  }
}
