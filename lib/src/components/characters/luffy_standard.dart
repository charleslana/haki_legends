import 'package:flame/components.dart';
import 'package:haki_legends/src/models/character_model.dart';

class LuffyStandard {
  LuffyStandard._();

  static CharacterModel first() {
    final sprites = [
      SpriteAnimationFrameData(
        srcPosition: Vector2(145, 195),
        srcSize: Vector2(43, 75),
        stepTime: 0.2,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(57, 194),
        srcSize: Vector2(43, 75),
        stepTime: 0.2,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(189, 195),
        srcSize: Vector2(43, 75),
        stepTime: 0.2,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(427, 276),
        srcSize: Vector2(43, 75),
        stepTime: 0.2,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(233, 195),
        srcSize: Vector2(43, 75),
        stepTime: 0.2,
      ),
    ];
    return CharacterModel(
      spriteImage: 'characters/luffy1.png',
      size: Vector2(43, 75),
      sprites: sprites,
    );
  }
}
