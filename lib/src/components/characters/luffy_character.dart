import 'package:haki_legends/src/components/characters/luffy_run.dart';
import 'package:haki_legends/src/components/characters/luffy_standard.dart';
import 'package:haki_legends/src/enums/character_mode_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';

class LuffyCharacter {
  LuffyCharacter._();

  static CharacterModel standard(CharacterModeEnum mode) {
    switch (mode) {
      case CharacterModeEnum.one:
        return LuffyStandard.first();
      default:
        return LuffyStandard.first();
    }
  }

  static CharacterModel run(CharacterModeEnum mode) {
    switch (mode) {
      case CharacterModeEnum.one:
        return LuffyRun.first();
      default:
        return LuffyRun.first();
    }
  }
}
