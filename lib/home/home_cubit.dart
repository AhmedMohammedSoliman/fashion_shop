import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/api_manager/api_manager.dart';
import 'package:my_app/home/Banners/banners_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  BannersModel? bannersModel ;

  void bannerFun ()async {
    emit(LoadingState());
  var response = await ApiManager.getBannersCall();
  if (response.status == true){
    bannersModel = response ;
    emit(SuccessState());
  }else if (response.status == false){
    emit(FailedState(message: response.message ?? ""));
  }
  }
}
