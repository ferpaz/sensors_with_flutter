import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_provider.g.dart';

@riverpod
FutureOr<Pokemon> pokemon (PokemonRef ref, String id) async {
  final pokemonsRepository = ref.watch(pokemonsRepositoryProvider);

  final (pokemon, error) = await pokemonsRepository.getPokemon(id);

  if (pokemon != null) {
    return pokemon;
  } else {
    throw error;
  }
}

@riverpod
PokemonsRepositoryBase pokemonsRepository(PokemonsRepositoryRef ref) {
  return PokemonsRepository();
}