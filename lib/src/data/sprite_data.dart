import 'package:flame/components.dart';
import 'package:haki_legends/src/components/characters/luffy_character.dart';
import 'package:haki_legends/src/components/characters/usopp_character.dart';
import 'package:haki_legends/src/enums/character_mode_enum.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';

class SpriteData {
  SpriteData._();

  static CharacterModel luffy(CharacterMoveEnum move) {
    switch (move) {
      case CharacterMoveEnum.standard:
        return LuffyCharacter.standard(CharacterModeEnum.one);
      case CharacterMoveEnum.run:
        return LuffyCharacter.run(CharacterModeEnum.one);
      default:
        return LuffyCharacter.standard(CharacterModeEnum.one);
    }
  }

  static CharacterModel usopp() {
    return UsoppCharacter.standard(CharacterModeEnum.one);
  }
}
