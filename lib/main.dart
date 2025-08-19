import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_firebase/core/bottom_nav.dart';
import 'package:first_firebase/features/books/bloc/book_bloc.dart';
// import 'package:first_firebase/features/books/data/send_books.dart';
// import 'package:first_firebase/features/books/screens/book_store_page.dart';
import 'package:first_firebase/features/books/data/books_repository.dart';
import 'package:first_firebase/features/login/auth_login.dart';
import 'package:first_firebase/features/login/bloc/login_bloc.dart';
//import 'package:first_firebase/features/login/loginScreen.dart';
import 'package:first_firebase/features/signup/auth_signup.dart';
import 'package:first_firebase/features/signup/bloc/signup_bloc.dart';
// import 'package:first_firebase/features/signup/my_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_firebase/features/signup/my_home.dart';
import 'package:first_firebase/utiles/theme/bloc/theme_bloc.dart';
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
    final bookRepository = BookRepository(
      firestore: FirebaseFirestore.instance,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignUpBloc(authService: AuthSignUpService()),
        ),
        BlocProvider(create: (_) => LoginBloc(authService: AuthLoginService())),
        BlocProvider(
          create:
              (_) =>
                  BookBloc(bookRepository: bookRepository)
                    ..add(LoadBooksEvent()),
        ),
        BlocProvider(create: (_) => ThemeBloc()),
      ],

      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Firebase Auth',
            theme: themeState.themeData,
            home: MyHomePage(title: 'Sign Up'),
          );
        },
      ),
    );
  }
}
