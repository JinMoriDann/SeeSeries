import 'package:flutter/material.dart';
import 'package:seemovies/features/auth/register/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            SizedBox(height: 150, child: Image.asset('images/logo_white.png')),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: RegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}
