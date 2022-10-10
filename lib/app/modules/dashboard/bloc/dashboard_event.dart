part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardInitEvent extends DashboardEvent {
  const DashboardInitEvent();
}

class DashboardSearchGiftEvent extends DashboardEvent {
  final String word;
  const DashboardSearchGiftEvent(this.word);
}

class LoadedDashboardEvent extends DashboardEvent {
  const LoadedDashboardEvent();
}

class LoadingDashboardEvent extends DashboardEvent {
  const LoadingDashboardEvent();
}
