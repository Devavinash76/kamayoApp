import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController =
    TextEditingController(text: 'customerdev@kamayo.com');
    final passwordController = TextEditingController(text: 'Dev@12345');
    final isPasswordVisible = false.obs;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Name & Tagline
                const Text(
                  "Kamayo",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Just shop and earn",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 32),

                const Icon(Icons.lock_outline, size: 72, color: Colors.deepPurple),
                const SizedBox(height: 16),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Login to your account",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 32),

                // Email
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password with visibility
                Obx(() => TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        isPasswordVisible.toggle();
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                )),
                const SizedBox(height: 24),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        if (email == 'customerdev@kamayo.com' &&
                            password == 'Dev@12345') {
                          Get.offNamed('/home');
                        } else {
                          Get.snackbar(
                            'Login Failed',
                            'Invalid email or password',
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.login, color: Colors.white),
                    label: const Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/register');
                      },
                      child: const Text('Register'),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
