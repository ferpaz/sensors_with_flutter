
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

class PokemonsRepository implements PokemonsRepositoryBase {
  final PokemonsDatasourceBase datasource;

  PokemonsRepository({ PokemonsDatasourceBase? datasource })
  : datasource = datasource ?? PokemonsDatasource();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) {
    return datasource.getPokemon(id);
  }
}