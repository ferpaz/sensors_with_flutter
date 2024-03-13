import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_localdb_provider.g.dart';

@riverpod
FutureOr<List<Pokemon>> pokemonsLocalDb(PokemonsLocalDbRef ref) async {
  final pokemonsLocalDbRepository = ref.watch(pokemonLocalDbRepositoryProvider);

  final pokemons = await pokemonsLocalDbRepository.loadPokemons();
  return pokemons;
}

@riverpod
IsarPokemonsRepository pokemonLocalDbRepository(PokemonLocalDbRepositoryRef ref) {
  return IsarPokemonsRepository();
}