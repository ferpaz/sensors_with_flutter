import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

void main() {
  // Necesito que el móvil solo este en Portrait y no se pueda rotar
  // para que el giroscopio funcione correctamente
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const ProviderScope(child: MainApp()));
}

// Se convierte a StatefulWidget para poder usar WidgetsBindingObserver
class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

// Se convierte a ConsumerState para usar un StateProvider para guardar el estado de la App
class MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {

  // Se implementa el método initState para poder agregar el observer del estado de la App
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  // Se implementa el método dispose para poder remover el observer del estado de la App
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  // Se implementa el método didChangeAppLifecycleState para poder guardar el estado de la App en el StateProvider
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    // Cada vez que la app se reanude, se inicializa el proveedor de estado de los permisos
    // con esto se logra que se actualice la pantalla
    if (state == AppLifecycleState.resumed) {
      await ref.read(asyncPermissionsProvider.notifier).checkSettings();
    }
    ref.read(appStateProvider.notifier).state = state;

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
