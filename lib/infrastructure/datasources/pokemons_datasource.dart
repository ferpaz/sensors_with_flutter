import 'package:dio/dio.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';


class PokemonsDatasource implements PokemonsDatasourceBase {
  final Dio dio;

  PokemonsDatasource()
  : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final result = await dio.get('/pokemon/$id');
      final pokemon = PokemonMapper.pokemonResponseToPokemon(result.data);
      return (pokemon, 'Success');
    } catch (e) {
      return (null, 'Error fetching pokemon $e');
    }
  }
}