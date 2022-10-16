import 'package:haki_legends/src/components/characters/usopp_standard.dart';
import 'package:haki_legends/src/enums/character_mode_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';

class UsoppCharacter {
  UsoppCharacter._();

  static CharacterModel standard(CharacterModeEnum mode) {
    switch (mode) {
      case CharacterModeEnum.one:
        return UsoppStandard.first();
      default:
        return UsoppStandard.first();
    }
  }
}
