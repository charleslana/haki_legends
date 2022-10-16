import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haki_legends/src/data/sprite_data.dart';
import 'package:haki_legends/src/enums/character_move_enum.dart';
import 'package:haki_legends/src/models/character_model.dart';

final battleProvider = ChangeNotifierProvider(
  (ref) => BattleProvider(SpriteData.luffy(CharacterMoveEnum.standard)),
);

class BattleProvider extends ValueNotifier<CharacterModel> {
  BattleProvider(CharacterModel character) : super(character);

  bool runMove = false;

  @override
  set value(CharacterModel character) {
    value = character;
  }

  void changeMove() {
    runMove = true;
  }
}
