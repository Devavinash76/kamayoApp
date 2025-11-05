import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed('/login');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Kamayo',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Just shop and earn',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              color: Colors.deepPurple,
              strokeWidth: 2.5,
            ),
          ],
        ),
      ),
    );
  }
}
