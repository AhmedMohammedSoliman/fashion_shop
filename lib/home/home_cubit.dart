import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/api_manager/api_manager.dart';
import 'package:my_app/home/Banners/banners_model.dart';
import 'package:my_app/home/Banners/categories_model.dart';

import 'Banners/products_home_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  BannersModel? bannersModel ;
  CategoriesModel? categoriesModel ;
  ProductsHomeModel? productsHomeModel ;
  List<Product> filteredList = [] ;
  List<Product> mainProductList = [] ;


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

  void categoryFun()async{

  emit(LoadingState());
    try {
      var response = await ApiManager.getAllCategories();
      if (response.status == true){
        print("done");
        categoriesModel = response ;
       emit(SuccessState());
      }
    }catch (e){
      rethrow ;
    }
  }

  void productsHomeFun ()async{
    emit(LoadingState());
    try {
     var response = await ApiManager.getHomeProducts();
     if (response.status == true){
       print("productsHome");
       productsHomeModel = response ;
       mainProductList = response.data.products;
       emit(SuccessState());
     }
   }catch (e){
      print("failed");
     rethrow ;
   }
  }
  
  void searchFun (String input){
    filteredList = mainProductList.where((product) => product.name.toLowerCase().startsWith(input.toLowerCase())).toList();
    print("search");
    emit(SuccessState());
  }
}
