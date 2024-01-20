import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'services_event.dart';

part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(ServicesInitial()) {
    on<SearchClickedEvt>(_onSearchClicked);
    on<NotificationClickedEvt>(_onNotificationClicked);
    on<SubmitClickedEvt>(_onSubmitClicked);
  }

  _onSearchClicked(SearchClickedEvt event, emit) {
    emit(LoadingState());
    emit(SearchState());
  }

  _onNotificationClicked(NotificationClickedEvt event, emit) {
    emit(LoadingState());
    emit(NotificationState());
  }

  _onSubmitClicked(SubmitClickedEvt event, emit) {
    emit(LoadingState());
    emit(SubmitState());
  }
}
