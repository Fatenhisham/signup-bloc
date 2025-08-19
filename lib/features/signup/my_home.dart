import 'package:first_firebase/core/bottom_nav.dart';
// import 'package:first_firebase/features/books/screens/book_store_page.dart';
import 'package:first_firebase/features/login/LoginScreen.dart';
import 'package:first_firebase/features/signup/bloc/signup_bloc.dart';
import 'package:first_firebase/features/signup/validation/validation_confirm_password.dart';
import 'package:first_firebase/features/signup/validation/validation_email_field.dart';
import 'package:first_firebase/core/custom_text_field.dart';
import 'package:first_firebase/features/signup/validation/validation_password_field.dart';
import 'package:first_firebase/features/signup/validation/validation_username.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            Fluttertoast.showToast(msg: state.errorMessage);
          } else if (state is SignUpSuccess) {
            Fluttertoast.showToast(msg: "Welcome, ${state.email}");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          }
        },
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            bool isLoading = state is SignUpLoading;

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign up',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Create your account',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 20),

                        CustomTextField(
                          textFieldController: usernameController,
                          textFieldValidator: validationUsernameField(
                            context: context,
                          ),
                          textFieldTitle: 'Username',
                          icon: Icon(Icons.person, color: Color(0xff9A392C)),
                        ),

                        const SizedBox(height: 15),

                        CustomTextField(
                          textFieldController: emailController,
                          textFieldValidator: validationEmailField(
                            context: context,
                          ),
                          textFieldTitle: 'Email',
                          icon: Icon(Icons.email, color: Color(0xff9A392C)),
                        ),

                        const SizedBox(height: 15),

                        CustomTextField(
                          textFieldTitle: 'Password',
                          textFieldController: passwordController,
                          textFieldValidator: validationPasswordField(
                            context: context,
                          ),
                          icon: Icon(Icons.lock, color: Color(0xff9A392C)),
                          isObscureText: true,
                        ),

                        const SizedBox(height: 15),

                        CustomTextField(
                          textFieldTitle: 'Confirm Password',
                          textFieldController: confirmPasswordController,
                          textFieldValidator: validationConfirmPasswordField(
                            context: context,
                            passwordController: passwordController,
                          ),
                          icon: Icon(
                            Icons.lock_outline,
                            color: Color(0xff9A392C),
                          ),
                          isObscureText: true,
                        ),

                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed:
                              isLoading
                                  ? null
                                  : () {
                                    if (_formKey.currentState!.validate()) {
                                      final email = emailController.text;
                                      final password = passwordController.text;

                                      context.read<SignUpBloc>().add(
                                        SignUpSubmittedEvent(email, password),
                                      );
                                    }
                                  },

                          child:
                              isLoading
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                        ),
                        const SizedBox(height: 15),

                        // const Text('Or', style: TextStyle(fontSize: 20)),
                        // const SizedBox(height: 15),

                        // ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.white,
                        //     minimumSize: const Size(300, 50),
                        //   ),
                        //   child: const Text(
                        //     'Sign in with Google',
                        //     style: TextStyle(
                        //       fontSize: 25,
                        //       color: Color(0xFF9B29B2),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?       '),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(title: 'Login'),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
