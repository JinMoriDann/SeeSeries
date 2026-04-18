import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passwordVisibity = true;
  late final windowWidth = MediaQuery.of(context).size.width;

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
                  Navigator.pushNamed(context, '/home');
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
