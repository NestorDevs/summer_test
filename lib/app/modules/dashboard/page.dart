import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sumer/app/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_sumer/app/modules/dashboard/shared/debouncer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Debouncer debouncer = Debouncer(milliseconds: 500);

    return BlocProvider(
        create: (context) =>
            Modular.get<DashboardBloc>()..add(const DashboardInitEvent()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 50),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Buscar por nombre',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
                onChanged: (value) => debouncer(() {
                  Modular.get<DashboardBloc>()
                      .add(DashboardSearchGiftEvent(value));
                }),
              ),
            ),
            const ListGift()
          ],
        ));
  }
}

class ListGiftResult extends StatelessWidget {
  final DashboardLoaded state;
  const ListGiftResult({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: state.model.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final gif = state.model[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                gif.url,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListGift extends StatelessWidget {
  const ListGift({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardError) {
          return const Center(
            child: Text('Error'),
          );
        }
        if (state is DashboardLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DashboardLoaded) {
          return ListGiftResult(state: state);
        }

        return Container();
      },
    );
  }
}
