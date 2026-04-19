import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seemovies/core/services/firestore_service.dart';
import 'package:seemovies/core/themes/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  final String nameOfContext;
  const SideMenu({super.key, required this.nameOfContext});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String userName = '';

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final _userName = await FirestoreService.getUser(
      prefs.getString('userUid')!,
    );
    setState(() {
      userName = _userName.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors().primary),
      child: Column(
        children: [
          Container(
            child: Text(
              'Welcome $userName',
              style: TextStyle(color: AppColors().white),
            ),
          ),
          _MenuItem(
            icon: Icons.home,
            title: 'Home',
            nameOfContext: widget.nameOfContext,
            route: '/home',
          ),
          _MenuItem(
            icon: Icons.settings,
            title: 'Settings',
            nameOfContext: widget.nameOfContext,
            route: '/conf',
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Logout',
                style: TextStyle(color: AppColors().primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String nameOfContext;
  final String route;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.nameOfContext,
    required this.route,
  });

  @override
  bool get isActivi => nameOfContext == title;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: isActivi ? Colors.grey[600] : Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(icon, color: AppColors().white),
                SizedBox(width: 10),
                Text(title, style: TextStyle(color: AppColors().white)),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
