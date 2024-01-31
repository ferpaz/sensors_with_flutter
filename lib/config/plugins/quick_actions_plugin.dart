import 'package:quick_actions/quick_actions.dart';
import '../router/app_router.dart';

class QuickActionsPlugin {

  static registerActions() {
    const QuickActions quickActions = QuickActions();

    quickActions.initialize((String shortcutType) {
      switch (shortcutType) {
        case 'biometrics':
          appRouter.push('/biometrics');
          break;
        case 'compass':
          appRouter.push('/sensors/compass');
          break;
        case 'pokemons':
          appRouter.push('/pokemons');
          break;
        case 'charmander':
          appRouter.push('/pokemons/4');
          break;
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(type: 'biometrics', localizedTitle: 'Biometrics', icon: 'finger'),
      const ShortcutItem(type: 'compass', localizedTitle: 'Compass', icon: 'compass'),
      const ShortcutItem(type: 'pokemons', localizedTitle: 'Pokemons', icon: 'pokemons'),
      const ShortcutItem(type: 'charmander', localizedTitle: 'Charmander', icon: 'charmander')
    ]);
  }
}