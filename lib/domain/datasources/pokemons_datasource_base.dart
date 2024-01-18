import 'package:miscelaneos/domain/domain.dart';

abstract class PokemonsDatasourceBase {
  Future<(Pokemon?, String)> getPokemon(String id);
}