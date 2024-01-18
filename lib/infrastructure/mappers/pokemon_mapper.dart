import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

class PokemonMapper {
  static Pokemon pokemonResponseToPokemon( Map<String, dynamic> json) {
    final pokemonResponse = PokemonResponse.fromJson(json);

    return Pokemon(
      id: pokemonResponse.id.toString(),
      name: pokemonResponse.name,
      spriteFront: pokemonResponse.sprites.frontDefault,
    );
  }
}