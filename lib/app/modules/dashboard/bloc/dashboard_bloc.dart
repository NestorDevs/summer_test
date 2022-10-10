import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_sumer/app/modules/dashboard/models/git_model.dart';
import 'package:test_sumer/app/modules/dashboard/repositories/gifs_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GifRepository repository;

  DashboardBloc({required this.repository}) : super(const DashboardInitial()) {
    on<DashboardInitEvent>(initEvent);
    on<DashboardSearchGiftEvent>(onFindGif);
  }

  void initEvent(DashboardInitEvent event, Emitter<DashboardState> emit) async {
    log('poteee');
    try {
      emit(const DashboardLoading());

      final gifs = await repository.getRandomGif();

      emit(DashboardLoaded(gifs));
    } catch (_) {
      emit(const DashboardError());
    }
  }

  Future<void> onFindGif(
      DashboardSearchGiftEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(const DashboardLoading());

      final gifs = await repository.searchGif(event.word);

      emit(DashboardLoaded(gifs));
    } catch (_) {
      emit(const DashboardError());
    }
  }
}
