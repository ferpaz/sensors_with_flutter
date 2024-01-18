import 'package:miscelaneos/domain/domain.dart';

abstract class PokemonsRepositoryBase {
  Future<(Pokemon?, String)> getPokemon(String id);
}