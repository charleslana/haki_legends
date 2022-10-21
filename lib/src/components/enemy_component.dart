import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:haki_legends/src/battle/battle_game.dart';
import 'package:haki_legends/src/battle/character_line.dart';
import 'package:haki_legends/src/enums/character_line_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';

class EnemyComponent extends PositionComponent with HasGameRef<BattleGame> {
  EnemyComponent(
    this.character,
    this.line,
  ) : super() {
    debugMode = true;
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
      ..y = positionY
      ..flipHorizontally();
    await add(_spriteAnimationComponent);
    await add(RectangleHitbox());
    return super.onLoad();
  }
}
