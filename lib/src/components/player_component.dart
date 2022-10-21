import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haki_legends/src/battle/battle_game.dart';
import 'package:haki_legends/src/battle/character_line.dart';
import 'package:haki_legends/src/components/enemy_component.dart';
import 'package:haki_legends/src/enums/character_line_enum.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';
import 'package:haki_legends/src/providers/battle_provider.dart';

class PlayerComponent extends PositionComponent
    with HasGameRef<BattleGame>, CollisionCallbacks {
  PlayerComponent(
    this.character,
    this.line,
  ) : super() {
    debugMode = true;
    size = character.runSprites[0].srcSize;
    position.x = CharacterLine.getPosition(line, 694).x;
    position.y = CharacterLine.getPosition(line, 600).y;
  }

  final CharacterModel character;
  final CharacterLineEnum line;

  double positionX = 0;
  double positionY = 0;
  Vector2 characterSize = Vector2.all(0);

  late SpriteAnimationComponent _spriteAnimationComponent;
  late SpriteAnimation _standard;
  late SpriteAnimation _run;

  @override
  Future<void>? onLoad() async {
    final characterImage = await Images().load(character.image);
    positionX = CharacterLine.getPosition(line, gameRef.size.y).x;
    positionY = CharacterLine.getPosition(line, gameRef.size.y).y;
    characterSize = character.standardSprites[0].srcSize *
        CharacterLine.getScale(gameRef.size);
    _standard = SpriteAnimation.fromFrameData(
      characterImage,
      SpriteAnimationData(character.standardSprites),
    );
    _run = SpriteAnimation.fromFrameData(
      characterImage,
      SpriteAnimationData(character.runSprites),
    );
    _spriteAnimationComponent = SpriteAnimationComponent()
      ..animation = _standard
      ..size = characterSize
      ..anchor = Anchor.bottomCenter
      ..x = positionX
      ..y = positionY;
    await add(_spriteAnimationComponent);
    await add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is EnemyComponent) {
      print('collision');
    }
    super.onCollision(intersectionPoints, other);
  }

  void changeMove(CharacterMoveEnum move, WidgetRef ref) {
    switch (move) {
      case CharacterMoveEnum.standard:
        ref.read(battleProvider.notifier).changeMove(move);
        _spriteAnimationComponent
          ..size = (character.standardSprites[0].srcSize *
              CharacterLine.getScale(gameRef.size))
          ..animation = _standard;
        break;
      case CharacterMoveEnum.run:
        ref.read(battleProvider.notifier).changeMove(move);
        _spriteAnimationComponent
          ..size = (character.runSprites[0].srcSize *
              CharacterLine.getScale(gameRef.size))
          ..animation = _run;
        break;
      default:
    }
  }
}
