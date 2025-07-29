import 'package:first_firebase/features/login/LoginScreen.dart';
import 'package:first_firebase/features/signup/bloc/signup_bloc.dart';
import 'package:first_firebase/features/signup/validation/validation_email_field.dart';
import 'package:first_firebase/core/custom_text_field.dart';
import 'package:first_firebase/features/signup/validation/validation_password_field.dart';
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
                        const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Create your account',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 20),

                       CustomTextField(textFieldTitle: 'Username', icon: Icon(Icons.person)) ,
                       
                        const SizedBox(height: 15),

                       CustomTextField(textFieldController: emailController, textFieldValidator: validationEmailField(context: context), textFieldTitle: 'Email',icon:Icon(Icons.email) ,) , 
                       
                        const SizedBox(height: 15),

                      CustomTextField(textFieldTitle:'Password', textFieldController:passwordController , textFieldValidator: validationPasswordField(context: context), icon: Icon(Icons.lock), ) , 
                        // TextFormField(
                        //   controller: passwordController,
                        //   validator: validationPasswordField(context: context),
                        //   obscureText: true,
                        //   decoration: const InputDecoration(
                        //     filled: true,
                        //     fillColor: Color(0xFFEFE4F2),
                        //     border: OutlineInputBorder(),
                        //     prefixIcon: Icon(Icons.lock),
                        //     labelText: 'Password',
                        //   ),
                        // ),
                        const SizedBox(height: 15),

                       CustomTextField(textFieldTitle:'Confirm Password' , icon: Icon(Icons.lock_outline)), 
                       
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9B29B2),
                            minimumSize: const Size(400, 50),
                          ),
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

                        const Text('Or', style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 15),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(300, 50),
                          ),
                          child: const Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF9B29B2),
                            ),
                          ),
                        ),

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
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Color(0xFF9B29B2),
                                  fontWeight: FontWeight.bold,
                                ),
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
