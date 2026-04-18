import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/conf/widgets/conf_form.dart';

class ConfPage extends StatelessWidget {
  const ConfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primary,
      appBar: AppBar(
        backgroundColor: AppColors().primary,
        leading: Icon(Icons.menu, color: AppColors().white),
        title: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text("Configuration", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(32), child: ConfForm()),
      ),
    );
  }
}
