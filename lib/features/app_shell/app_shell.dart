import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:seemovies/features/app_shell/widgets/side_menu.dart';

class AppShel extends StatefulWidget {
  final String title;
  final Widget body;
  const AppShel({super.key, required this.body, required this.title});

  @override
  State<AppShel> createState() => _AppShelState();
}

class _AppShelState extends State<AppShel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primary,
      appBar: AppBar(
        backgroundColor: AppColors().primary,
        iconTheme: IconThemeData(color: AppColors().white),
        title: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text(widget.title, style: TextStyle(color: Colors.white)),
        ),
      ),
      drawer: Drawer(width: 280, child: SideMenu(nameOfContext: widget.title)),
      body: widget.body,
    );
  }
}
