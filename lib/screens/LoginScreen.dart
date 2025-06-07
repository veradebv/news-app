import 'package:flutter/material.dart';
import 'package:newsapp/ViewModel/LoginViewModel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(title: Text("Login")),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Image.asset('assets/images/Instagram.png', height: 100),
                  SizedBox(height: 20),
                  TextField(
                    controller: viewModel.emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: viewModel.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 30),
                  viewModel.isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () => viewModel.login(context),
                          child: Text("Log in"),
                        ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Forgot your details? '),
                      GestureDetector(
                        onTap: () {
                          print('Get help tapped');
                        },
                        child: Text(
                          'Get help logging in',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
