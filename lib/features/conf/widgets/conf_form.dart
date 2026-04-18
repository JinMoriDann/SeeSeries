import 'package:flutter/material.dart';
import 'package:seemovies/core/themes/app_colors.dart';

class ConfForm extends StatelessWidget {
  const ConfForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors().white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "My configurations",
                style: TextStyle(
                  color: AppColors().primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          icon: Icon(Icons.email),
                          label: Text('My e-mail'),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Change my password:',
                style: TextStyle(color: AppColors().primary, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: Icon(Icons.password),
                    label: Text('My password'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: Icon(Icons.password),
                    label: Text('New password'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: Icon(Icons.password),
                    label: Text('Confirm new password'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors().primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 8,
                    top: 8,
                  ),
                  child: Text(
                    'Change my password',
                    style: TextStyle(color: AppColors().white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
