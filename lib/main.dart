import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/register/auth_bloc_cubit.dart';
import 'my_app.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AuthCubit(),
      child: MyApp()));
}


