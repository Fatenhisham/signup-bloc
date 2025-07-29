import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;
  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),

              Text(
                'Enter your credential to login',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 150),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFEFE4F2),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                ),
              ),

              SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFEFE4F2),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                  labelText: 'password',
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9B29B2),
                  minimumSize: Size(400, 50),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              SizedBox(height: 100),
              Text(
                'Forget Password?',
                style: TextStyle(fontSize: 20, color: Color(0xFF9B29B2)),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?       '),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign Up',

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
    );
  }
}
