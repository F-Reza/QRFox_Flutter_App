import 'package:flutter/material.dart';

class DevInfo extends StatelessWidget {
  static const String routeName = '/info';
  const DevInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const MainDrawer(),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCCCFF),
        centerTitle: true,
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/app_icon.png',width: 200,)
          ],
        ),
      ),
    );
  }
}
