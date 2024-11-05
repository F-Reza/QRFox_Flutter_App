import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'dev_info.dart';
import 'qr_canner.dart';
import 'qr_generator.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCCCFF),
        centerTitle: true,
        title: const Text('QRFox'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, QrScanner.routeName);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 180,
                    decoration: BoxDecoration(
                        color: const Color(0xFFCCCCFF),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1
                          ),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1
                          ),
                        ]
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.qr_code_scanner,size: 55,),
                        SizedBox(height: 10,),
                        Text("Scanner"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, QrGenerator.routeName);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 180,
                    decoration: BoxDecoration(
                        color: const Color(0xFFCCCCFF),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1
                          ),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1
                          ),
                        ]
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.qr_code,size: 55,),
                        SizedBox(height: 10,),
                        Text("Generator"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, DevInfo.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                width: 280,
                height: 120,
                decoration: BoxDecoration(
                    color: const Color(0xFFCCCCFF),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                    ]
                ),
                child: const Text("QRFox",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
