import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seemovies/core/services/firestore_service.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/auth/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool passwordVisibity = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> _register(
    String emailAddress,
    String name,
    String password,
    String confirmPassword,
  ) async {
    if (emailAddress.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Email or password is empty')),
      );
    }
    if (confirmPassword != password) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: Passwords do not match')));
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      final firebaseUser = credential.user;

      if (firebaseUser == null) {
        throw Exception('Usuário não foi criado corretamente.');
      }

      final newUser = UserModel(
        uid: firebaseUser.uid,
        name: nameController.text.trim(),
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userUid', credential.user!.uid);

      await FirestoreService.createUser(newUser);
      Navigator.pushNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: The password provided is too weak.')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: The account already exists for that email.'),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void setVisibility() {
    setState(() {
      passwordVisibity = !passwordVisibity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;

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
                  'REGISTRE-SE',
                  style: TextStyle(color: AppColors().primary, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text('Name'),
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  icon: Icon(Icons.password_outlined),
                  label: Text('Confirm password'),
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
                      'Register',
                      style: TextStyle(color: AppColors().white),
                    ),
                  ),
                ),
                onTap: () {
                  _register(
                    emailAddressController.text,
                    nameController.text,
                    passwordController.text,
                    confirmPasswordController.text,
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Login',
                style: TextStyle(color: AppColors().primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
