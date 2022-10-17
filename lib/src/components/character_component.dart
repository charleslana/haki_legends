import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:haki_legends/src/components/characters/luffy1_character.dart';
import 'package:haki_legends/src/models/character_model.dart';
import 'package:haki_legends/src/pages/battle_page.dart';

class CharacterComponent extends SpriteAnimationComponent
    with HasGameRef<BattleGame> {
  CharacterComponent(
    this.character,
    this.positionX,
    this.positionY,
  );

  final CharacterModel character;
  final double positionX;
  final double positionY;

  late SpriteAnimationComponent _characterComponent;
  late Image _characterImage;
  late double _characterScaleFactor;

  @override
  Future<void>? onLoad() async {
    final characterPositionX = gameRef.size.x / 50 * positionX;
    final characterPositionY = gameRef.size.y / 50 * positionY;
    _characterScaleFactor = gameRef.size.y / 50 * 0.17;
    _characterImage = await Images().load(character.spriteImage);
    final characterAnimation = SpriteAnimation.fromFrameData(
      _characterImage,
      SpriteAnimationData(character.sprites),
    );
    _characterComponent = SpriteAnimationComponent()
      ..animation = characterAnimation
      ..size = character.size * _characterScaleFactor
      ..position = Vector2(characterPositionX, characterPositionY)
      ..anchor = Anchor.center;
    if (character.isFlip) {
      _characterComponent.flipHorizontally();
    }
    await add(_characterComponent);
    return super.onLoad();
  }

  void setAnimation() {
    final run = Luffy1Character.run();
    _characterComponent
      ..animation = SpriteAnimation.fromFrameData(
        _characterImage,
        SpriteAnimationData(run.sprites),
      )
      ..size = run.size * _characterScaleFactor;
  }
}
