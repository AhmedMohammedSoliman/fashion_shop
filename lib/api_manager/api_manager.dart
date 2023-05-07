import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/home/Banners/banners_model.dart';
import 'package:my_app/login/Login_Model.dart';
import 'package:my_app/my_app.dart';
import 'package:my_app/profile/profile_model.dart';
import '../register/Register_model.dart';

class ApiManager {

  static const String baseUrl = "student.valuxapps.com/api/";

  static Future<RegisterModel> registerCall ({required String email , required String phone ,
  required String password , required String name}) async {

    var url = Uri.parse("https://student.valuxapps.com/api/register");

    try {
      var response = await http.post(url , body: {
        "name" : name ,
        "phone" : phone ,
        "email" : email ,
        "password" : password
      } , headers: {
        "lang" : "en" ,
      });

      var body = response.body ;

      var json = jsonDecode(body) ;

      var registerObject = RegisterModel.fromJson(json);
      print(body) ;

      return registerObject ;
    }catch (e){
      rethrow ;
    }finally {
      print("register finally");
    }
  }


  static Future<LoginModel> loginCall ({required String email , required String password}) async{

    var url = Uri.parse("https://student.valuxapps.com/api/login");

    try {
      var response = await http.post(url  , body: {
        "email" : email ,
        "password" : password
      } , headers: {
        "lang" : "en"
      }) ;

      var body = response.body ;

      var json = jsonDecode(body) ;

      var loginObject = LoginModel.fromJson(json);
      print(body);
      return loginObject ;
    }catch (e){
      rethrow ;
    }finally {
      print("login finally");
    }
  }

  static Future<ProfileModel> getProfileCall ()async{

    var url = Uri.parse("https://student.valuxapps.com/api/profile");

    var response = await http.get(url , headers: {
      "Authorization" : MyApp.getUserToken()!,
      "lang" : "en"
    });
    var body = response.body;
    var json = jsonDecode(body);
    var profileObject = ProfileModel.fromJson(json);

    return profileObject ;
  }


  static Future<BannersModel> getBannersCall ()async{
    var url = Uri.parse("https://student.valuxapps.com/api/banners");
    
    var response = await http.get(url);

    var body = response.body ;

    var json = jsonDecode(body);
    var bannerObject = BannersModel.fromJson(json);

    return bannerObject ;
  }


}