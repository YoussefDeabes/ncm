part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class SearchClickedEvt extends DashboardEvent {}

class NotificationClickedEvt extends DashboardEvent {}

class ClimateDataRequestClickedEvt extends DashboardEvent {}

class RequestAWeatherReportClickedEvt extends DashboardEvent {}

class FreeForecastReportClickedEvt extends DashboardEvent {}

class ViewAllClickedEvt extends DashboardEvent {}
