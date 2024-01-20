part of 'services_bloc.dart';

@immutable
abstract class ServicesEvent {}

class SearchClickedEvt extends ServicesEvent {}

class NotificationClickedEvt extends ServicesEvent {}

class SubmitClickedEvt extends ServicesEvent {}
