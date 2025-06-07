import 'package:flutter/material.dart';
import 'package:newsapp/screens/HomeScreen.dart';
import 'package:newsapp/services/dio_client.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> login(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(context, 'Please enter email and password');
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final response = await DioClient.dio.post(
        'http://192.168.1.9:3000/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      isLoading = false;
      notifyListeners();

      print('Login success: ${response.data}');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Login error: $e');
      _showSnackBar(context, 'Login failed');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
