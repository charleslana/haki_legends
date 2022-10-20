import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:haki_legends/src/components/characters/luffy1_character.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';
import 'package:haki_legends/src/pages/battle_page.dart';

class CharacterComponent extends SpriteAnimationComponent
    with HasGameRef<BattleGame>, CollisionCallbacks {
  CharacterComponent(
    this.character,
    this.positionX,
    this.positionY,
  ) : super() {
    debugMode = true;
  }

  final CharacterModel character;
  final double positionX;
  final double positionY;

  late SpriteAnimationComponent _characterComponent;
  late Image _characterImage;
  late double characterScaleFactor;
  late SpriteAnimation _standard;
  late SpriteAnimation _run;
  late double characterPositionX;
  late double characterPositionY;

  @override
  Future<void>? onLoad() async {
    characterPositionX = gameRef.size.x / 50 * positionX;
    characterPositionY = gameRef.size.y / 50 * positionY;
    characterScaleFactor = gameRef.size.y / 50 * 0.17;
    _characterImage = await Images().load(character.spriteImage);
    _standard = SpriteAnimation.fromFrameData(
      _characterImage,
      SpriteAnimationData(character.sprites),
    );
    _characterComponent = SpriteAnimationComponent()
      ..animation = _standard
      ..size = character.size * characterScaleFactor
      // ..position = Vector2(characterPositionX, characterPositionY)
      ..anchor = Anchor.center
      ..x = characterPositionX
      ..y = characterPositionY;
    if (character.isFlip) {
      _characterComponent.flipHorizontally();
    }
    _run = SpriteAnimation.fromFrameData(
      _characterImage,
      SpriteAnimationData(Luffy1Character.run().sprites),
    );
    await add(_characterComponent);
    await add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    print('hit');
    if (other is CharacterComponent) {
      print('é character');
    }
    super.onCollision(intersectionPoints, other);
  }

  void changeCurrentAnimation() {}

  void setAnimation(CharacterModel character, CharacterMoveEnum move) {
    _characterComponent
      ..animation = move == CharacterMoveEnum.run ? _run : _standard
      ..size = character.size * characterScaleFactor;
  }
}
