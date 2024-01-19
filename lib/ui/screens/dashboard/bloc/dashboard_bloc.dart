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

  _onSearchClicked(SearchClickedEvt event, emit) {
    emit(LoadingState());
    emit(SearchState());
  }

  _onNotificationClicked(NotificationClickedEvt event, emit) {
    emit(LoadingState());
    emit(NotificationState());
  }

  _onClimateDataRequestClicked(ClimateDataRequestClickedEvt event, emit) {
    emit(LoadingState());
    emit(ClimateDataRequestState());
  }

  _onRequestAWeatherReportClicked(RequestAWeatherReportClickedEvt event, emit) {
    emit(LoadingState());
    emit(RequestAWeatherReportState());
  }

  _onFreeForecastReportClicked(FreeForecastReportClickedEvt event, emit) {
    emit(LoadingState());
    emit(FreeForecastReportState());
  }

  _onViewAllClicked(ViewAllClickedEvt event, emit) {
    emit(LoadingState());
    emit(ViewAllState());
  }
}
