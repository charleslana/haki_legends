import 'package:haki_legends/src/enums/line_enum.dart';

enum CharacterLineEnum {
  player1(
    line: LineEnum.line1,
    reverse: false,
  ),
  enemy1(
    line: LineEnum.line1,
    reverse: true,
  );

  const CharacterLineEnum({
    required this.line,
    required this.reverse,
  });

  final LineEnum line;
  final bool reverse;
}
