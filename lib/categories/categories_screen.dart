import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/app_routes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_app/home/home_cubit.dart';

class CategoriesScreen extends StatefulWidget {

  static const String routeName = AppRoutes.categoriesRoute;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit , HomeState>(
          builder: (context , state){
            return SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    SizedBox(height: 20,),
                    Expanded(
                      child: GridView.builder(
                        itemCount: bloc.categoriesModel!.data.data.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2 ,
                            mainAxisSpacing: 10 ,
                            crossAxisSpacing: 10
                          ),
                          itemBuilder: (context , index) {
                          return Container(
                            child: Column(
                              children: [
                                Expanded(child: Image(image: NetworkImage(bloc.categoriesModel!.data.data[index].image))),
                                SizedBox(height: 10,),
                                Text (bloc.categoriesModel!.data.data
                                [index].name)
                              ],
                            ),
                          );
                          }),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context , state){
            if (state is FailedState) {
              showDialog(context: context, builder: (context) =>
              AlertDialog(content: Text(state.message),)
              );
            }else if (state is SuccessState){
              print("categories second data");
            }
          })
    ;
  }

}