import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sumer/app/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:test_sumer/app/modules/dashboard/repositories/gifs_repository.dart';

import 'page.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      ((i) => DashboardBloc(
            repository: i.get(),
          )),
    ),
    Bind((i) => GifRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const DashboardPage(),
    ),
  ];
}
