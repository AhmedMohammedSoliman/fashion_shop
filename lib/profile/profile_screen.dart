import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/app_routes.dart';
import 'package:my_app/profile/profile_cubit.dart';
import 'package:my_app/profile/profile_model.dart';

class ProfileScreen extends StatefulWidget {

  static const String routeName = AppRoutes.profileRoute;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProfileCubit>(context);
     bloc.profileFun();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is SuccessState){
          // showDialog(context: context, builder: (context) => AlertDialog(
          //   backgroundColor: Colors.red,
          //   content: Text ("done" , style: TextStyle(color: Colors.white),),
          // ));
          print("profile data");
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
              body: state is LoadingState ? Center(child: CircularProgressIndicator(
                color: Colors.red,
              ),) :
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack (
                        alignment: Alignment.bottomCenter,
                        children: [
                          Opacity(
                            opacity: 0.2,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                image: DecorationImage (
                                    image: AssetImage ("assets/images/fashion.jpg") ,
                                  fit: BoxFit.fill
                                )
                              ),
                            ),

                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.4,
                            decoration: BoxDecoration (
                              color: Color(0xffa67c00),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 100,
                                  decoration: BoxDecoration (
                                    shape: BoxShape.circle ,
                                    color: Colors.grey[200],
                                  ),
                                  child: Image (image: AssetImage ("assets/images/logo.png"),),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text ("Name : " , style: TextStyle (color: Colors.white,
                                    fontSize: 18),) ,
                                    SizedBox(width: 10,),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text (bloc.profileModel!.data!.name),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                    ) ,
                                  ],
                                ) ,
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text ("Email : "  , style: TextStyle (color: Colors.white ,
                                        fontSize: 18)) ,
                                    SizedBox(width: 10,),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text (bloc.profileModel!.data!.email),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                    ) ,
                                  ],
                                ) ,
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text ("Phone : " , style: TextStyle (color: Colors.white ,
                                        fontSize: 18))  ,
                                    SizedBox(width: 10,),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text (bloc.profileModel!.data!.phone),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                    ) ,
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  )

          ),
        );
      },
    );
  }
}