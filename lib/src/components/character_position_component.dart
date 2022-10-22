import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:haki_legends/src/battle/battle_game.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/providers/battle_provider.dart';

class CharacterPositionComponent extends PositionComponent
    with HasGameRef<BattleGame>, CollisionCallbacks {
  CharacterPositionComponent(
    this.characterPosition,
    this.characterSize,
    this.refSize,
  ) : super() {
    debugMode = true;
    size = characterSize * (refSize.y / 350);
    position = characterPosition;
    anchor = Anchor.bottomCenter;
  }

  final Vector2 characterPosition;
  final Vector2 characterSize;
  final Vector2 refSize;

  @override
  Future<void>? onLoad() {
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is CharacterPositionComponent) {
      print('collision');
      gameRef.ref.read(battleProvider.notifier).move =
          CharacterMoveEnum.standard;
    }
    super.onCollision(intersectionPoints, other);
  }
}
