import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/register/auth_bloc_cubit.dart';

import '../core/app_routes.dart';
import '../core/app_strings.dart';
import '../register/widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = AppRoutes.loginRoute ;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "" ;
  String password = "" ;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthCubit>(context);
   return BlocConsumer<AuthCubit , AuthStates>(
     listener: (context , state){
       if (state is RegisterSuccessState){
         Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
       }else if (state is RegisterFailedState){
         showDialog(context: context, builder: (context) => AlertDialog(
           backgroundColor: Colors.red,
           content: Text (state.message , style: TextStyle(color: Colors.white),),
         ));
       }
     },
     builder: (context , state) {
       return SafeArea(
         child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text (AppStrings.logIn , style: Theme.of(context).textTheme.bodyLarge,),
                      ],
                    ),
                    Form(
                        key: formKey,
                        child: Column (
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            TextFieldWidget (hint: AppStrings.enterEmail,onchange: (text){
                              email = text ;
                            }, validator: (text) {
                              if (text == null || text.trim().isEmpty){
                                return "Please email is required" ;
                              }else {
                                return null ;
                              }
                            }, controller: emailController, keyBoardType: TextInputType.emailAddress, obsure: false,) ,
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            TextFieldWidget (hint: AppStrings.enterPassword,onchange: (text){
                              password = text ;
                            }, validator: (text) {
                              if (text == null || text.trim().isEmpty){
                                return "Please password is required" ;
                              }else {
                                return null ;
                              }
                            }, controller: passwordController, keyBoardType: TextInputType.visiblePassword, obsure: true,) ,
                            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          ],
                        )),
                    state is LoadingState && formKey.currentState?.validate() == true ? CircularProgressIndicator(color: Colors.red,) :
                    ElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate() == true){
                        bloc.loginFun(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    }, child: Text ("Login") , style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffa67c00)),) ,
                  ],
                ),
              ),
            ),
          ),
         ),
       );
     },
      );
  }
}