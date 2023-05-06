part of 'auth_bloc_cubit.dart';

abstract class AuthStates {}

class InitialAuthState extends AuthStates {}

class LoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterFailedState extends AuthStates {

  String message ;

  RegisterFailedState({required this.message});
}
