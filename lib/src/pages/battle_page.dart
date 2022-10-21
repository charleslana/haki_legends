import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haki_legends/src/battle/battle_game.dart';
import 'package:haki_legends/src/widgets/button_widget.dart';

class BattlePage extends ConsumerWidget {
  const BattlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            GameWidget(
              game: BattleGame(ref),
              loadingBuilder: (context) => const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            ButtonWidget(callback: () => {}),
          ],
        ),
      ),
    );
  }
}
