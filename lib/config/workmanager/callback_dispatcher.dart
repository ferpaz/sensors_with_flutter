import 'package:miscelaneos/infrastructure/infrastructure.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey = 'me.ferpaz.sensorsapp.workmanager.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey = 'me.ferpaz.sensorsapp.workmanager.fetch-periodic-background-pokemon';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {

    switch (task) {
      case fetchBackgroundTaskKey:
        await cacheNextPokemon();
        break;

      case fetchPeriodicBackgroundTaskKey:
        print('Native: called background task: fetchPeriodicBackgroundTaskKey  --  inputData: $inputData');
        break;

      case Workmanager.iOSBackgroundTask:
        print('Native: called background task: Workmanager.iOSBackgroundTask  --  inputData: $inputData');
        break;

      default:
        print('Native: called background task: $task  --  inputData: $inputData');
    }

    return Future.value(true);
  });
}

void workManagerInitialize() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
}

void workManagerRegisterBackgroundTask(Map<String, dynamic> inputData) {
  Workmanager().registerOneOffTask(
    fetchBackgroundTaskKey,
    fetchBackgroundTaskKey,
    initialDelay: const Duration(seconds: 3),
    inputData: inputData,
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
}

void workManagerRegisterPeriodicBackgroundTask(Map<String, dynamic> inputData) {
  Workmanager().registerPeriodicTask(
    fetchPeriodicBackgroundTaskKey,
    fetchPeriodicBackgroundTaskKey,
    initialDelay: const Duration(seconds: 3),
    frequency: const Duration(minutes: 15),
    inputData: inputData,
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
}

Future cacheNextPokemon() async {
  final localDbRepository = IsarPokemonsRepository();
  final pokemonRepository = PokemonsRepository();

  final lastPokemonId = await localDbRepository.pokemonsCount() + 1;

  try {
    final (pokemon, message) = await pokemonRepository.getPokemon('$lastPokemonId');
    if (pokemon == null) throw message;

    await localDbRepository.insertPokemon(pokemon);
  }
  catch (e) {
    print('Native: loadNextPokemon - error: $e');
  }
}