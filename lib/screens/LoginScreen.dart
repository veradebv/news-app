import 'package:flutter/material.dart';
import 'package:newsapp/screens/HomeScreen.dart';
import 'package:newsapp/services/dio_client.dart';
import 'package:newsapp/widgets/LoginView.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _login(BuildContext context, String email, String password) async {
    try {
      final response = await DioClient.dio.post(
        'http://192.168.1.9:3000/login',
        data: {
          'email': 'user@example.com',
          'password': 'password123',
        },
      );
      print('Login success: ${response.data}');

      // Navigate to home
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => HomeScreen())
      );
    } catch (e) {
      print('Login error: $e');
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(
      onLogin: (email, password) => _login(context, email, password),
    );
  }
}