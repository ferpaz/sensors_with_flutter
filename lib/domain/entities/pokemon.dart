import 'package:isar/isar.dart';

part 'pokemon.g.dart';

@collection
class Pokemon {
  final Id isarId = Isar.autoIncrement;

  final String id;
  final String name;
  final String spriteFront;

  const Pokemon({
    required this.id,
    required this.name,
    required this.spriteFront,
  });
}