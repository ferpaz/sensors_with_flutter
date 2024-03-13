import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

class IsarPokemonsRepository extends LocalPokemonsRepositoryBase {
  final LocalPokemonsDatasourceBase datasource;

  IsarPokemonsRepository({ LocalPokemonsDatasourceBase? datasource })
  : datasource = datasource ?? IsarPokemonsDatasource();

  @override
  Future<void> insertPokemon(Pokemon pokemon) => datasource.insertPokemon(pokemon);

  @override
  Future<List<Pokemon>> loadPokemons() => datasource.loadPokemons();

  @override
  Future<int> pokemonsCount() => datasource.pokemonsCount();
}