import 'package:first_firebase/features/login/auth_login.dart';
import 'package:first_firebase/features/login/bloc/login_bloc.dart';
//import 'package:first_firebase/features/login/loginScreen.dart';
import 'package:first_firebase/features/signup/auth_signup.dart';
import 'package:first_firebase/features/signup/bloc/signup_bloc.dart';
import 'package:first_firebase/features/signup/my_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignUpBloc(authService: AuthSignUpService()),
        ),
        BlocProvider(create: (_) => LoginBloc(authService: AuthLoginService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Auth',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(title: 'Sign Up'),
      ),
    );
  }
}
