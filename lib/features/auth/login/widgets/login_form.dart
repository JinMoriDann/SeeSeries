import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passwordVisibity = true;
  late final windowWidth = MediaQuery.of(context).size.width;
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLogin();
  }

  Future<void> _login(String emailAddress, String password) async {
    if (emailAddress.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Email or password is empty')),
      );
    }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userUid', credential.user!.uid);
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: No user found for that email.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: Wrong password provided for that user.'),
          ),
        );
      }
    }
  }

  Future<void> _loadLogin() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userUid', user.uid);
        Navigator.pushNamed(context, '/home');
      }
    });
  }

  void setVisibility() {
    setState(() {
      passwordVisibity = !passwordVisibity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors().white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors().primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Icon(
                      Icons.person,
                      color: AppColors().white,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'LOGIN',
                  style: TextStyle(color: AppColors().primary, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailAddressController,
                decoration: InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  label: Text('E-mail'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  icon: Icon(Icons.password_outlined),
                  label: Text('Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      icon: Icon(
                        passwordVisibity
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setVisibility();
                      },
                    ),
                  ),
                ),
                obscureText: passwordVisibity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 20,
                bottom: 10,
              ),
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: windowWidth,
                  decoration: BoxDecoration(
                    color: AppColors().primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 8,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: AppColors().white),
                    ),
                  ),
                ),
                onTap: () {
                  _login(emailAddressController.text, passwordController.text);
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'I want to register',
                style: TextStyle(color: AppColors().primary),
              ),
            ),
            SizedBox(height: 2),
            TextButton(
              onPressed: () {},
              child: Text(
                'I forgot my password',
                style: TextStyle(color: AppColors().primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
