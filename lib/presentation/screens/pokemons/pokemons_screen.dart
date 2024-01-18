import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PokemonsView();
  }
}

class _PokemonsView extends ConsumerStatefulWidget {
  const _PokemonsView();

  @override
  PokemonsViewState createState() => PokemonsViewState();
}

class PokemonsViewState extends ConsumerState<_PokemonsView> {
  final scrollController = ScrollController();

  void infiniteScroll() {
    final currentPokemons = ref.read(pokemonIdsProvider);

    if (currentPokemons.length > 400) {
      scrollController.removeListener(infiniteScroll);
      return;
    }

    if ((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
      ref.read(pokemonIdsProvider.notifier).update((state) => [
        ...state,
        ...List.generate(30, (index) => index + state.length + 1),
      ]);
    }
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(infiniteScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: const [
        SliverAppBar(
          title: Text('Pokemons'),
        ),
        _PokemonGrid(),
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context, ref) {
    final pokemonIds = ref.watch(pokemonIdsProvider);

    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: pokemonIds.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => context.push('/pokemons/${index + 1}'),
        child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png', fit: BoxFit.cover,),
      ),
    );
  }
}