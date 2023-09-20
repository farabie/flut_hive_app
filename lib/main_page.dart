import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Hive Tutorial'),
      ),
      body: Center(
        child: Text('Demo Hive'),
      ),
    );
  }
}
