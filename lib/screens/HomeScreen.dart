import 'package:flutter/material.dart';
import 'package:newsapp/ViewModel/HomeViewModel.dart';
import 'package:newsapp/screens/HomeView.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const HomeView(),
    );
  }
}
