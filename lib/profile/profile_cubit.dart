import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/api_manager/api_manager.dart';
import 'package:my_app/profile/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialState());
   ProfileModel? profileModel ;
  void profileFun ()async{
    emit(LoadingState());
  var response = await ApiManager.getProfileCall();
    if (response.status == true){
      profileModel = response ;
      emit(SuccessState(profileModel: response));
    }else if (response.status == false){
      emit(FailedState(message: response.message ?? ""));
    }
  }
}
