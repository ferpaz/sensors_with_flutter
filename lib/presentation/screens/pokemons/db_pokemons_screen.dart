import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class DbPokemonsScreen extends ConsumerWidget {
  const DbPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonsListAsync = ref.watch(pokemonsLocalDbProvider);

    final isBackgroundTaskRunning = ref.watch(backgroundTasksProvider.select((value) => value.isRunning));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Process'),
        actions: [
          IconButton(
            onPressed: () => workManagerRegisterBackgroundTask(),
            icon: const Icon(Icons.add_alarm_sharp),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          pokemonsListAsync.when(
            data: (list) {
              return _PokemonsGrid(pokemons: list);
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(
                child: Text('Error: $error'),
              ),
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ref.read(backgroundTasksProvider.notifier).toggleCurrentState(),
        label: !isBackgroundTaskRunning
          ? const Text('INICIAR tarea de fondo')
          : const Text('DETENER tarea de fondo'),
        icon: const Icon(Icons.av_timer),
      ),
    );
  }
}

class _PokemonsGrid extends StatelessWidget {
  final List<Pokemon> pokemons;

  const _PokemonsGrid({required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];

        return Column(
          children: [
            Image.network(
              pokemon.spriteFront,
              fit: BoxFit.contain,
            ),
            Text(pokemon.name),
          ],
        );
      },
    );
  }
}