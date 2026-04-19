import 'package:flutter/material.dart';
import 'package:seemovies/features/app_shell/app_shell.dart';
import 'package:seemovies/features/conf/widgets/conf_form.dart';

class ConfPage extends StatelessWidget {
  const ConfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShel(
      title: 'Settings',
      body: Center(
        child: Padding(padding: const EdgeInsets.all(32), child: ConfForm()),
      ),
    );
  }
}
