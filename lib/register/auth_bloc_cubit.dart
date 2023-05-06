import 'package:bloc/bloc.dart';
import 'package:my_app/api_manager/api_manager.dart';
part 'auth_bloc_state.dart';


class AuthCubit extends Cubit <AuthStates> {
  AuthCubit() : super (InitialAuthState());

  void registerFun ({required String email , required String phone , required String password ,
  required String name})async{
    emit(LoadingState());
   var response =  await ApiManager.registerCall(email: email, phone: phone, password: password, name: name);
   if (response.status == true){
     emit(RegisterSuccessState());
   }else if (response.status == false){
     emit(RegisterFailedState(message: response.message ?? ""));
   }
  }

  void loginFun ({required String email , required String password})async{
     emit(LoadingState());
   var response =  await ApiManager.loginCall(email: email, password: password);

   if (response.status == true){
     emit(RegisterSuccessState());
   }else if (response.status == false){
     emit(RegisterFailedState(message: response.message ?? ""));
   }

  }
}
