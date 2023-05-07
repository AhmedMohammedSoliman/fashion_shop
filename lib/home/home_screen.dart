import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/app_routes.dart';
import 'package:my_app/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = AppRoutes.homeRoute;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);
    bloc.bannerFun();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SuccessState){
          print("banner data");
        }else if (state is FailedState){
          showDialog(context: context, builder: (context) => AlertDialog(
            backgroundColor: Colors.red,
            content: Text (state.message , style: TextStyle(color: Colors.white),),
          ));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: state is LoadingState? Center(child: CircularProgressIndicator(
                color: Colors.red))
                : Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index) => InkWell(
                        onTap: (){
                          selectedIndex = index ;
                          setState((){});
                        },
                        child: Container(
                          child: Image(
                          image: NetworkImage (bloc.bannersModel!.data![index].image),
                        ) ,),
                      ),
                      separatorBuilder: (context , index) => SizedBox(height: 10,),
                      itemCount: bloc.bannersModel?.data!.length ?? 0),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  child: ListView.separated(
                    shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context , index) => Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration (
                            border: Border.all(color: Colors.green),
                              color: selectedIndex == index ? Colors.green :
                              Colors.transparent,
                              shape: BoxShape.circle
                          ),
                        ),
                        separatorBuilder: (context , index) => SizedBox(width: 5,),
                        itemCount: bloc.bannersModel!.data!.length),
                ),
              ],
            )
          ),
        );
      },
    );
  }
}