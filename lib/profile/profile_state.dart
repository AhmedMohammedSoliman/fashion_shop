part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class InitialState extends ProfileState {}
class LoadingState extends ProfileState {}
class SuccessState extends ProfileState {

  ProfileModel profileModel ;
  SuccessState ({required this.profileModel});
}
class FailedState extends ProfileState {

  String message ;
  FailedState ({required this.message});
}
