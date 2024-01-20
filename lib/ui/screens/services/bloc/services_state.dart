part of 'services_bloc.dart';

@immutable
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class SearchState extends ServicesState {}

class NotificationState extends ServicesState {}

class LoadingState extends ServicesState {}

class SubmitState extends ServicesState {}
