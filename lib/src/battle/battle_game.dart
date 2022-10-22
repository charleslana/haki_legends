import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haki_legends/src/battle/character_line.dart';
import 'package:haki_legends/src/components/battle_background_component.dart';
import 'package:haki_legends/src/components/character_component.dart';
import 'package:haki_legends/src/components/character_position_component.dart';
import 'package:haki_legends/src/components/character_sprite.dart';
import 'package:haki_legends/src/components/skill_action_component.dart';
import 'package:haki_legends/src/components/skill_component.dart';
import 'package:haki_legends/src/enums/character_line_enum.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/providers/battle_provider.dart';

class BattleGame extends FlameGame
    with HasTappableComponents, HasCollisionDetection {
  BattleGame(this.ref);

  final WidgetRef ref;

  late CharacterPositionComponent leftLine1;
  late CharacterComponent playerComponent;

  @override
  Color backgroundColor() {
    return Colors.white;
  }

  @override
  Future<void>? onLoad() {
    add(BattleBackgroundComponent());
    final player1 = CharacterSprite.luffy1();
    playerComponent = CharacterComponent(character: player1);
    leftLine1 = CharacterPositionComponent(
      CharacterLine.getPosition(CharacterLineEnum.leftLine1, size),
      playerComponent.character.standardSprites[0].srcSize,
      size,
    )..add(playerComponent);
    add(leftLine1);
    final enemy1 = CharacterSprite.usopp();
    final enemyComponent = CharacterComponent(character: enemy1);
    final rightLine1 = CharacterPositionComponent(
      CharacterLine.getPosition(CharacterLineEnum.rightLine1, size),
      enemyComponent.character.standardSprites[0].srcSize,
      size,
    )
      ..add(enemyComponent)
      ..flipHorizontally();
    add(rightLine1);
    add(SkillComponent(size));
    add(SkillActionComponent());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    final move = ref.watch(battleProvider).move;
    if (move == CharacterMoveEnum.run &&
        (leftLine1.x + leftLine1.size.x) < size.x) {
      leftLine1
        ..x += size.x / 120
        ..priority = 1;
      return;
    }
    if (move == CharacterMoveEnum.standard &&
        playerComponent.standard != null) {
      playerComponent.changeMove(move, ref);
      print('standard');
      if (leftLine1.x >= leftLine1.characterPosition.x) {
        leftLine1.x -= size.x / 40;
      }
    }
  }
}
