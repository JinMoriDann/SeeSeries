import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seemovies/features/auth/register/pages/register_page.dart';
import 'package:seemovies/features/conf/pages/conf_page.dart';
import 'package:seemovies/features/home/pages/home_page.dart';
import 'package:seemovies/features/auth/login/pages/login_page.dart';
import 'package:seemovies/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(SeeMovieApp());
}

class SeeMovieApp extends StatelessWidget {
  const SeeMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/conf': (context) => ConfPage(),
      },
    );
  }
}
