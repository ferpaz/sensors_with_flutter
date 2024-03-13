// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_localdb_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonsLocalDbHash() => r'5965ca34998f1c5dded1c832a99517cda22ce808';

/// See also [pokemonsLocalDb].
@ProviderFor(pokemonsLocalDb)
final pokemonsLocalDbProvider =
    AutoDisposeFutureProvider<List<Pokemon>>.internal(
  pokemonsLocalDb,
  name: r'pokemonsLocalDbProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonsLocalDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PokemonsLocalDbRef = AutoDisposeFutureProviderRef<List<Pokemon>>;
String _$pokemonLocalDbRepositoryHash() =>
    r'f33f66a4b0d966c2fe0692b035101475cc76b2f5';

/// See also [pokemonLocalDbRepository].
@ProviderFor(pokemonLocalDbRepository)
final pokemonLocalDbRepositoryProvider =
    AutoDisposeProvider<IsarPokemonsRepository>.internal(
  pokemonLocalDbRepository,
  name: r'pokemonLocalDbRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonLocalDbRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PokemonLocalDbRepositoryRef
    = AutoDisposeProviderRef<IsarPokemonsRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
