import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<SearchClickedEvt>(_onSearchClicked);
    on<NotificationClickedEvt>(_onNotificationClicked);
    on<ClimateDataRequestClickedEvt>(_onClimateDataRequestClicked);
    on<RequestAWeatherReportClickedEvt>(_onRequestAWeatherReportClicked);
    on<FreeForecastReportClickedEvt>(_onFreeForecastReportClicked);
    on<ViewAllClickedEvt>(_onViewAllClicked);
  }

  _onSearchClicked(SearchClickedEvt event, emit) {}

  _onNotificationClicked(NotificationClickedEvt event, emit) {}

  _onClimateDataRequestClicked(ClimateDataRequestClickedEvt event, emit) {}

  _onRequestAWeatherReportClicked(
      RequestAWeatherReportClickedEvt event, emit) {}

  _onFreeForecastReportClicked(FreeForecastReportClickedEvt event, emit) {}

  _onViewAllClicked(ViewAllClickedEvt event, emit) {}
}
