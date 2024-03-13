import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey = 'me.ferpaz.sensorsapp.workmanager.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey = 'me.ferpaz.sensorsapp.workmanager.fetch-periodic-background-pokemon';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {

    switch (task) {
      case fetchBackgroundTaskKey:
        print('Native: called background task: fetchBackgroundTaskKey  --  inputData: $inputData');
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