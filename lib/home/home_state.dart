part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {}

class FailedState extends HomeState {

  String message ;

  FailedState ({required this.message});
}
