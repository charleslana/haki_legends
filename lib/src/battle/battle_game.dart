import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haki_legends/src/components/battle_background_component.dart';
import 'package:haki_legends/src/components/character_sprite.dart';
import 'package:haki_legends/src/components/enemy_component.dart';
import 'package:haki_legends/src/components/player_component.dart';
import 'package:haki_legends/src/components/skill_component.dart';
import 'package:haki_legends/src/enums/character_line_enum.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/providers/battle_provider.dart';

class BattleGame extends FlameGame
    with HasTappableComponents, HasCollisionDetection {
  BattleGame(this.ref);

  final WidgetRef ref;

  late PlayerComponent playerComponent;
  late EnemyComponent enemyComponent;

  @override
  Color backgroundColor() {
    return Colors.white;
  }

  @override
  Future<void>? onLoad() {
    add(BattleBackgroundComponent());
    final playerTopLeft = CharacterSprite.luffy1();
    playerComponent = PlayerComponent(playerTopLeft, CharacterLineEnum.player1);
    add(playerComponent);
    final enemyTopRight = CharacterSprite.usopp();
    enemyComponent = EnemyComponent(enemyTopRight, CharacterLineEnum.enemy1);
    add(enemyComponent);
    add(SkillComponent());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final move = ref.watch(battleProvider).move;
    if (move == CharacterMoveEnum.run &&
        (playerComponent.x + playerComponent.characterSize.x) <
            (size.x - playerComponent.positionX)) {
      playerComponent
        ..x += size.y / 70
        ..priority = 1;
    }
    super.update(dt);
  }
}
