part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class SearchState extends DashboardState {}

class NotificationState extends DashboardState {}

class ClimateDataRequestState extends DashboardState {}

class RequestAWeatherReportState extends DashboardState {}

class FreeForecastReportState extends DashboardState {}

class ViewAllState extends DashboardState {}

class LoadingState extends DashboardState {}
