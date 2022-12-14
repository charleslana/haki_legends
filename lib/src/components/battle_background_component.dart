import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:haki_legends/src/battle/battle_game.dart';

class BattleBackgroundComponent extends SpriteAnimationComponent
    with HasGameRef<BattleGame> {
  @override
  Future<void>? onLoad() async {
    final backgroundImage = await Images().load('battle/bg/1.png');
    final background = SpriteComponent.fromImage(
      backgroundImage,
      size: gameRef.size,
    );
    await add(background);
    return super.onLoad();
  }
}
