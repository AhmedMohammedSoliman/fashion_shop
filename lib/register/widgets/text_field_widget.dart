import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)? ;
typedef OnChange = void Function(String)? ;
class TextFieldWidget extends StatelessWidget{

  String hint ;
  Validator validator ;
  OnChange onchange ;
  TextEditingController controller ;
  TextInputType keyBoardType ;
  bool obsure ;
  TextFieldWidget ({required this.hint, required this.validator , required this.onchange ,
  required this.controller , required this.keyBoardType, required this.obsure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsure,
      keyboardType: keyBoardType,
      validator: validator ,
      onChanged: onchange,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        hintText: hint ,
        filled: true ,
        fillColor: Colors.grey[200] ,
        border: InputBorder.none,
      ),
    );
  }
}