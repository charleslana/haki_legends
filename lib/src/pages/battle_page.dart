import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haki_legends/src/components/battle_bg_component.dart';
import 'package:haki_legends/src/components/character_component.dart';
import 'package:haki_legends/src/components/characters/luffy1_character.dart';
import 'package:haki_legends/src/data/line_data.dart';
import 'package:haki_legends/src/data/sprite_data.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/providers/battle_provider.dart';
import 'package:haki_legends/src/widgets/button_widget.dart';

class BattlePage extends ConsumerWidget {
  const BattlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            GameWidget(
              game: BattleGame(ref),
              loadingBuilder: (context) => const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            ButtonWidget(ref: ref),
          ],
        ),
      ),
    );
  }
}

class BattleGame extends FlameGame with HasCollisionDetection {
  BattleGame(this.ref);

  final WidgetRef ref;

  late CharacterComponent player;
  late CharacterComponent enemy;

  @override
  Color backgroundColor() {
    return Colors.white;
  }

  @override
  Future<void>? onLoad() async {
    await add(BattleBgComponent());
    final characterValue = ref.watch(battleProvider).value;
    player = CharacterComponent(
      characterValue,
      LineData.leftPosition1.x,
      LineData.leftPosition1.y,
    );
    await add(player);
    //update characterModel
    // ref.read(characterProvider.notifier).update(character);
    final enemyValue = SpriteData.usopp().copyWith(isFlip: true);
    enemy = CharacterComponent(
      enemyValue,
      LineData.rightPosition1.x,
      LineData.rightPosition1.y,
    );
    await player.parent!.add(enemy);
    return super.onLoad();
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    final isRunMove = ref.watch(battleProvider).runMove;
    if (isRunMove) {
      // player
      //   ..setAnimation(Luffy1Character.run(), CharacterMoveEnum.run)
      //   ..x += size.y / 70
      //   ..priority = 1;
      // // ..y += 1;
      if (player.x + (player.character.size.x * player.characterScaleFactor) <
          size.x - player.characterPositionX) {
        player
          ..setAnimation(Luffy1Character.run(), CharacterMoveEnum.run)
          ..x += size.y / 70
          ..priority = 1;
        // ..y += 1;
        return;
      }
      // ref.read(battleProvider.notifier).runMove = false;
      return;
    }
    player
      ..setAnimation(Luffy1Character.standard(), CharacterMoveEnum.standard)
      ..position = Vector2(0, 0);
  }
}
