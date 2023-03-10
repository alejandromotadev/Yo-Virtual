import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yo_virtual/services/auth.dart';

class OnLogin extends StatefulWidget {
  const OnLogin({Key? key}) : super(key: key);

  @override
  State<OnLogin> createState() => _OnLoginState();
}

class _OnLoginState extends State<OnLogin> {
  String? errorMessage = '';
  bool isLogin = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        errorMessage == "" ? "" : '$errorMessage',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(color: Colors.white70),
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500)),
    );
  }

  Widget _title() {
    return Column(
      children: const [
        Text('Hello',
            style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold)),
        Text('Glad you are here',
            style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _loginSocial() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Auth().signInWithGoogle();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: const Text('Sign in with Google',
              style: TextStyle(color: Colors.black)),
        )
      ],
    );
  }

  Widget _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: () {},
          child: const Text(
            'Forgot my password',
            style: TextStyle(color: Colors.white60, fontSize: 11),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _title(),
                      if (!isLogin) _entryField('user', userController),
                      _entryField('email', emailController),
                      _entryField('password', passwordController),
                      _forgotPassword(),
                      _errorMessage(),
                      _submitButton(),
                      _loginOrRegisterButton(),
                      const Text(
                        'Or continue with',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      _loginSocial(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
