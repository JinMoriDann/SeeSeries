import 'package:flutter/material.dart';
import 'package:seemovies/features/auth/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            SizedBox(height: 300, child: Image.asset('images/logo_white.png')),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
