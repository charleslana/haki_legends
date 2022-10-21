import 'package:flame/components.dart';
import 'package:haki_legends/src/models/character_model.dart';

class CharacterSprite {
  CharacterSprite._();

  static CharacterModel luffy1() {
    final standardSprites = [
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
    final runSprites = [
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
      image: 'characters/luffy1.png',
      standardSprites: standardSprites,
      runSprites: runSprites,
    );
  }

  static CharacterModel usopp() {
    final standardSprites = [
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
      image: 'characters/usopp.png',
      standardSprites: standardSprites,
      runSprites: standardSprites,
    );
  }
}
