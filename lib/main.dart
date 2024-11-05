import 'package:flutter/material.dart';

import 'view/home_screen.dart';
import 'view/dev_info.dart';
import 'view/qr_canner.dart';
import 'view/qr_generator.dart';
import 'widgets/main_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRFox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        //useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        MainDrawer.routeName : (_) => const MainDrawer(),
        HomeScreen.routeName : (_) => const HomeScreen(),
        QrScanner.routeName : (_) => const QrScanner(),
        QrGenerator.routeName : (_) => const QrGenerator(),
        DevInfo.routeName : (_) => const DevInfo(),
      },
    );
  }
}
