import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'auth_bloc_state.dart';

class AuthBlocCubit extends Cubit<AuthBlocState> {
  AuthBlocCubit() : super(AuthBlocInitial());
}
