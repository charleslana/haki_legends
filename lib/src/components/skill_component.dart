import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:haki_legends/src/battle/battle_game.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/providers/battle_provider.dart';

class SkillComponent extends PositionComponent
    with HasGameRef<BattleGame>, TapCallbacks {
  SkillComponent()
      : super(
          anchor: Anchor.center,
          size: Vector2.all(100),
        );

  bool tapped = false;
  final Vector2 _tapPosition = Vector2.zero();

  final _paint = Paint()..color = const Color(0xffffffff);

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position
      ..y = size.y / 1.5
      ..x = size.x / 2;
  }

  Vector2 get tapPosition => _tapPosition;

  @override
  void render(Canvas canvas) {
    debugMode = true;
    canvas.drawRect(size.toRect(), _paint);
  }

  @override
  void onTapUp(TapUpEvent event) {
    // print('tap up');
    final move = gameRef.ref.read(battleProvider.notifier).move;
    if (move != CharacterMoveEnum.standard) {
      gameRef.playerComponent
          .changeMove(CharacterMoveEnum.standard, gameRef.ref);
      return;
    }
    gameRef.playerComponent.changeMove(CharacterMoveEnum.run, gameRef.ref);
    super.onTapUp(event);
  }

  @override
  void onTapDown(TapDownEvent event) {
    // print('tap down');
    super.onTapDown(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    // print('tap cancel');
    super.onTapCancel(event);
  }
}
