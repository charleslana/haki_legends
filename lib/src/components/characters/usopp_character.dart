import 'package:flame/components.dart';
import 'package:haki_legends/src/models/character_model.dart';

class UsoppCharacter {
  UsoppCharacter._();

  static CharacterModel standard() {
    final sprites = [
      SpriteAnimationFrameData(
        srcPosition: Vector2(1241.5, 330),
        srcSize: Vector2(58, 57),
        stepTime: 0.25,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(886.5, 445),
        srcSize: Vector2(58, 57),
        stepTime: 0.25,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(285.5, 504),
        srcSize: Vector2(58, 57),
        stepTime: 0.25,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(945.5, 445),
        srcSize: Vector2(58, 57),
        stepTime: 0.25,
      ),
    ];
    return CharacterModel(
      spriteImage: 'characters/usopp.png',
      size: Vector2(58, 54),
      sprites: sprites,
    );
  }
}
