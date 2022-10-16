import 'package:flame/cache.dart';
import 'package:flame/components.dart';
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
  late double _characterPositionX;
  late double _characterPositionY;

  @override
  Future<void>? onLoad() async {
    _characterPositionX = gameRef.size.x / 50 * positionX;
    _characterPositionY = gameRef.size.y / 50 * positionY;
    final characterScaleFactor = gameRef.size.y / 50 * 0.17;
    final characterImage = await Images().load(character.spriteImage);
    final playerAnimation = SpriteAnimation.fromFrameData(
      characterImage,
      SpriteAnimationData(character.sprites),
    );
    _characterComponent = SpriteAnimationComponent()
      ..animation = playerAnimation
      ..size = character.size * characterScaleFactor
      ..position = Vector2(_characterPositionX, _characterPositionY)
      ..anchor = Anchor.center;
    if (character.isFlip) {
      _characterComponent.flipHorizontally();
    }
    await add(_characterComponent);
    return super.onLoad();
  }
}
