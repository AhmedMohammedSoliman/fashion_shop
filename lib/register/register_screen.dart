import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/app_routes.dart';
import 'package:my_app/register/auth_bloc_cubit.dart';
import 'package:my_app/register/widgets/text_field_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../core/app_strings.dart';

class RegisterScreen extends StatelessWidget {

  static const String routeName = AppRoutes.registerRoute ;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String name = "" ;
  String email = "" ;
  String phone = "" ;
  String password = "" ;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit , AuthStates>(
      listener: (context , state) {
       if (state is RegisterSuccessState){
         print("navigate");
         Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
        }else if (state is RegisterFailedState && formKey.currentState?.validate() == true){
         print("toast");
         showDialog(context: context, builder: (context) => AlertDialog(
           backgroundColor: Colors.red,
           content: Text (state.message , style: TextStyle (color: Colors.white),),
         ));
       }
      },
        builder: (context , state){
         return SafeArea(
           child: Scaffold (
             body: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: Center(
                 child: SingleChildScrollView(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Row(
                         children: [
                           Text (AppStrings.signUp , style: Theme.of(context).textTheme.bodyLarge,),
                         ],
                       ),
                       Form(
                         key: formKey,
                           child: Column (
                             children: [
                               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                               TextFieldWidget (hint: AppStrings.enterName,onchange: (text){
                                 name = text ;
                               }, validator: (text) {
                                 if (text == null || text.trim().isEmpty){
                                   return "Please name is required" ;
                                 }else {
                                   return null ;
                                 }
                               }, controller: nameController, keyBoardType: TextInputType.text, obsure: false,) ,
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
                               TextFieldWidget (hint: AppStrings.enterPhone,onchange: (text){
                                 phone = text ;
                               }, validator: (text) {
                                 if (text == null || text.trim().isEmpty){
                                   return "Please phone is required" ;
                                 }else {
                                   return null ;
                                 }
                               }, controller: phoneController, keyBoardType: TextInputType.phone, obsure: false,) ,
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
                           bloc.registerFun(
                               email: nameController.text,
                               phone: phoneController.text,
                               password: passwordController.text,
                               name: nameController.text);
                         }
                         bloc.registerFun(email: email, phone: phone, password: password, name: name);
                       }, child: Text ("Sign Up") , style: ElevatedButton.styleFrom(
                           backgroundColor: Color(0xffa67c00)),) ,
                       SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text ("Already have an account?"),
                           SizedBox(width: 10,),
                           InkWell(
                             onTap: (){
                               Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                             },
                               child: Text ("login" ,
                                 style: TextStyle (color: Color (0xffa67c00), fontSize: 18),)),
                         ],
                       )
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