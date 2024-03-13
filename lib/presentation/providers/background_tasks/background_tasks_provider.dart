import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:miscelaneos/config/config.dart';

part 'background_tasks_provider.g.dart';

@riverpod
class BackgroundTasks extends _$BackgroundTasks {
  @override
  TaskState build() {
    return const TaskState(processKeyName: fetchPeriodicBackgroundTaskKey);
  }

  checkCurrentState() async {
    final value = await SharedReferencesPlugin.getBool(state.processKeyName);
    state = state.copyWith(isRunning: value);
  }

  startTask() async {
    workManagerRegisterPeriodicBackgroundTask(keyName: state.processKeyName);
    await SharedReferencesPlugin.setBool(state.processKeyName, true);
    state = state.copyWith(isRunning: true);
  }

  cancelTask() async {
    workManagerCancelPeriodicBackgroundTask(keyName: state.processKeyName);
    await SharedReferencesPlugin.setBool(state.processKeyName, false);
    state = state.copyWith(isRunning: false);
  }

  toggleCurrentState() async {
    if (state.isRunning) {
      await cancelTask();
    } else {
      await startTask();
    }
  }
}


class TaskState {
  final bool isRunning;
  final String processKeyName;

  const TaskState({ this.isRunning = false, required this.processKeyName });

  TaskState copyWith({bool? isRunning, String? processKeyName})
    => TaskState(
      isRunning: isRunning ?? this.isRunning,
      processKeyName: processKeyName ?? this.processKeyName,
    );

  @override
  String toString() => '''{
    isRunning: $isRunning,
    processKey: $processKeyName
}''';
}