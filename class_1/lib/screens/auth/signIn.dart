// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:class_1/screens/auth/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form is use for Validation it's important to use it
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  // these two controllers are use to get the value from the textfield
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // this is use to get the Login of the firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Class 1 Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          // for validation we use form
          // Step 1: call the form widget
          child: Form(
            // Step 2: call the form Key  FOR VALIDATION
            key: _FormKey,
            // Step 3: call the column widget
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Step 4: call the TextField widget
                TextFormField(
                  // Step 5: call the controller that you have created
                  controller: _emailController,
                  // Step 6: call the validator for validation
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      // for creating login Function
                      // Step 1: make a if condition
                      if (_FormKey.currentState!.validate()) {
                        // Step 2: call the firebase auth and signInWithEmailAndPassword
                        _auth
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            // Step 3: if condition is true then push the home screen
                            .then((value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Home())))
                            // Step 4: if condition is false then print the error
                            .catchError((error) {
                          print(error);
                        });
                      }
                    },
                    child: const Text('Login')),

                const SizedBox(
                  height: 20,
                ),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const SignUp()));
                      },
                      child: const Text('Sign Up'))
                ])
              ],
            ),
          ),
        ));
  }
}
