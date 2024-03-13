import 'package:miscelaneos/domain/domain.dart';

abstract class LocalPokemonsRepositoryBase {
  Future<List<Pokemon>> loadPokemons();
  Future<int> pokemonsCount();
  Future<void> insertPokemon(Pokemon pokemon);
}