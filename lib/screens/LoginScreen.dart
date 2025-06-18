import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/ViewModel/LoginViewModel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/login_logo.svg',
                      height: 130,
                    ),
                  ),
                  SizedBox(height: 85),
                  TextField(
                    controller: viewModel.emailController,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xFFBF9264),
                        fontWeight: FontWeight.w200,
                        fontSize: 12
                      ),
                      hintText: 'email',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, // or FontWeight.w100 for ultra thin
                        fontSize: 16,
                        color: Colors.grey, // optional: adjust color
                      ),
                      prefixIcon: Icon(Icons.person, color: Color(0xFFE4BFBF)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Color(0xFFBF9264)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide:
                            BorderSide(color: Color(0xFFBF9264), width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: viewModel.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color(0xFFBF9264),
                        fontWeight: FontWeight.w200,
                        fontSize: 12
                      ),
                      prefixIcon: Icon(Icons.lock, color: Color(0xFFE4BFBF)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Color(0xFFBF9264)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide:
                            BorderSide(color: Color(0xFFBF9264), width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            activeColor: Color(0xFFBBD8A3),
                            checkColor: Colors.white,
                            side: BorderSide(color: Color(0xFFBBD8A3)),
                            onChanged: (bool? value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w200,
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle forgot password
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFFBBD8A3),
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),

                  // ✅ Replaced button below
                  viewModel.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => viewModel.login(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6F826A),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Get help tapped');
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
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
