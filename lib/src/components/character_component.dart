import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haki_legends/src/battle/battle_game.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';
import 'package:haki_legends/src/providers/battle_provider.dart';

class CharacterComponent extends SpriteAnimationComponent
    with HasGameRef<BattleGame> {
  CharacterComponent({
    required this.character,
  }) : super() {
    debugMode = true;
    position = Vector2(-10, 0);
  }

  final CharacterModel character;

  late SpriteAnimationComponent _spriteAnimationComponent;
  late SpriteAnimation _standard;
  late SpriteAnimation _run;

  @override
  Future<void>? onLoad() async {
    final characterImage = await Images().load(character.image);
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
      ..size = character.standardSprites[0].srcSize * (gameRef.size.y / 350);
    await add(_spriteAnimationComponent);
    return super.onLoad();
  }

  void changeMove(CharacterMoveEnum move, WidgetRef ref) {
    switch (move) {
      case CharacterMoveEnum.standard:
        ref.read(battleProvider.notifier).changeMove(move);
        _spriteAnimationComponent
          ..size = character.standardSprites[0].srcSize * (gameRef.size.y / 350)
          ..animation = _standard;
        break;
      case CharacterMoveEnum.run:
        ref.read(battleProvider.notifier).changeMove(move);
        _spriteAnimationComponent
          ..size = character.runSprites[0].srcSize * (gameRef.size.y / 350)
          ..animation = _run;
        break;
      default:
    }
  }
}
