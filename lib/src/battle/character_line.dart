import 'package:flame/components.dart';
import 'package:haki_legends/src/enums/character_line_enum.dart';

class CharacterLine {
  CharacterLine._();

  static Vector2 getPosition(CharacterLineEnum line, Vector2 size) {
    switch (line) {
      case CharacterLineEnum.leftLine1:
        return Vector2(size.x / 2.9, size.y / 2);
      case CharacterLineEnum.rightLine1:
        return Vector2(size.x / 1.5, size.y / 2);
      default:
        return Vector2(0, 0);
    }
  }

  static double getScale(Vector2 size) {
    return size.y / 350;
  }
}
