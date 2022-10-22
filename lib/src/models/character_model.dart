import 'package:flame/components.dart';

class CharacterModel {
  CharacterModel({
    required this.image,
    required this.standardSprites,
    required this.runSprites,
    required this.standardAttackSprites,
  });

  final String image;
  final List<SpriteAnimationFrameData> standardSprites;
  final List<SpriteAnimationFrameData> runSprites;
  final List<SpriteAnimationFrameData> standardAttackSprites;
}
