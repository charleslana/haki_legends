import 'package:flame/components.dart';
import 'package:haki_legends/src/enums/character_line_enum.dart';

class CharacterLine {
  CharacterLine._();

  static Vector2 getPosition(CharacterLineEnum line, double size) {
    switch (line) {
      case CharacterLineEnum.player1:
        return Vector2(size / 100 * 50, size / 100 * 45);
      case CharacterLineEnum.enemy1:
        return Vector2(size / 40 * 50, size / 100 * 45);
      default:
        return Vector2(0, 0);
    }
  }

  static double getScale(Vector2 size) {
    return size.y / 350;
  }
}
