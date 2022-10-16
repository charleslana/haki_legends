import 'package:flame/components.dart';
import 'package:haki_legends/src/models/character_model.dart';

class LuffyRun {
  LuffyRun._();

  static CharacterModel first() {
    final sprites = [
      SpriteAnimationFrameData(
        srcPosition: Vector2(393, 195),
        srcSize: Vector2(58, 78),
        stepTime: 0.1,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(451, 195),
        srcSize: Vector2(58, 78),
        stepTime: 0.1,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(0, 273),
        srcSize: Vector2(58, 78),
        stepTime: 0.1,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(58, 273),
        srcSize: Vector2(58, 78),
        stepTime: 0.1,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(116, 273),
        srcSize: Vector2(58, 78),
        stepTime: 0.1,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(174, 273),
        srcSize: Vector2(58, 78),
        stepTime: 0.1,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(232, 273),
        srcSize: Vector2(58, 78),
        stepTime: 0.1,
      ),
      SpriteAnimationFrameData(
        srcPosition: Vector2(290, 273),
        srcSize: Vector2(58, 78),
        stepTime: 0.1,
      ),
    ];
    return CharacterModel(
      spriteImage: 'characters/luffy1.png',
      size: Vector2(58, 78),
      sprites: sprites,
    );
  }
}
