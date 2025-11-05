import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/splash_page.dart';
import 'presentation/login_page.dart';
import 'presentation/registration_page.dart';
import 'presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth UI',
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/register', page: () => const RegistrationPage()),
        GetPage(name: '/home', page: () => const HomePage()),
      ],
    );
  }
}
