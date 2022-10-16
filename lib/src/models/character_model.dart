import 'package:flame/components.dart';

class CharacterModel {
  CharacterModel({
    required this.spriteImage,
    required this.size,
    required this.sprites,
    this.isFlip = false,
  });

  final String spriteImage;
  final Vector2 size;
  final List<SpriteAnimationFrameData> sprites;
  final bool isFlip;

  CharacterModel copyWith({
    String? spriteImage,
    Vector2? size,
    List<SpriteAnimationFrameData>? sprites,
    bool? isFlip,
  }) {
    return CharacterModel(
      spriteImage: spriteImage ?? this.spriteImage,
      size: size ?? this.size,
      sprites: sprites ?? this.sprites,
      isFlip: isFlip ?? this.isFlip,
    );
  }
}
