import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/pokemons/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;
  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return pokemonAsync.when(
      data: (pokemon) => _PokemonView(pokemon),
      error: (e, st) => _ErrorView(e.toString()),
      loading: () => const _LoadingView(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonView(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
          actions: [
            IconButton(
              icon: const Icon(Icons.share_outlined),
              onPressed: () {
                SharePlugin.shareLink(
                  'https://victorious-desert-01b286e0f.4.azurestaticapps.net/pokemons/${pokemon.id}/',
                  'Mira este pokemon');
              }
            ),
          ],
        ),
        body: Center(
          child: Image.network(
            pokemon.spriteFront,
            fit: BoxFit.contain,
            width: 200,
            height: 200,
          ),
        ),
      );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;
  const _ErrorView(this.error);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
