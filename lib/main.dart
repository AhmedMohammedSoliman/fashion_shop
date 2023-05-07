import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/home/home_cubit.dart';
import 'package:my_app/prefs/shared_prefs.dart';
import 'package:my_app/profile/profile_cubit.dart';
import 'package:my_app/register/auth_bloc_cubit.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.initPrefs();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => AuthCubit(),
          ),
      BlocProvider(
        create: (context) => ProfileCubit(),
      ),
      BlocProvider(
        create: (context) => HomeCubit(),
      ),
    ],
    child: MyApp(),
  ));
}


