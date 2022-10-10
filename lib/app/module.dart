import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sumer/app/modules/dashboard/module.dart';
import 'package:test_sumer/app/modules/splash/page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SplashPage(),
    ),
    ModuleRoute('/dashboard', module: DashboardModule()),
  ];
}
