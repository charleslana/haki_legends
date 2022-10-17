import 'package:haki_legends/src/components/characters/luffy1_character.dart';
import 'package:haki_legends/src/components/characters/usopp_character.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';

class SpriteData {
  SpriteData._();

  static CharacterModel luffy(CharacterMoveEnum move) {
    switch (move) {
      case CharacterMoveEnum.standard:
        return Luffy1Character.standard();
      case CharacterMoveEnum.run:
        return Luffy1Character.run();
      default:
        return Luffy1Character.standard();
    }
  }

  static CharacterModel usopp() {
    return UsoppCharacter.standard();
  }
}
