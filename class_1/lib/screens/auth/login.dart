import 'package:class_1/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final GlobalKey<FormState> _FormKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _FormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    String patern = r'\w+@\w+\.\w+';
                    if (value!.isEmpty) {
                      return 'please enter email';
                    }
                  },
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  validator: (value) {
                    // RegExp regex = RegExp(r'^.{6}$');
                    if (value!.isEmpty) {
                      return 'please enter email';
                    }
                    return null;
                    // if (!regex.hasMatch(value)) {
                    //   return ('Please enter correct password');
                    // }
                  },
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_FormKey.currentState!.validate()) {
                        await _auth
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordcontroller.text)
                            .then((value) {
                              Fluttertoast.showToast(msg: 'Login ');
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Home()));})
                            .catchError((error) {
                          Fluttertoast.showToast(msg: 'error');
                        });
                      }
                    },
                    child: const Text("Login"))
              ],
            ),
          ),
        ));
  }
}
