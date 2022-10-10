part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial() : super();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading() : super();
}

class DashboardLoaded extends DashboardState {
  final List<GifModel> model;

  const DashboardLoaded(this.model) : super();
}

class DashboardError extends DashboardState {
  const DashboardError() : super();
}
