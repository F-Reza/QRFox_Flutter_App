

import 'package:flutter/material.dart';
import 'package:qrfox/view/home_screen.dart';
import 'package:qrfox/view/dev_info.dart';
import 'package:qrfox/view/qr_canner.dart';
import 'package:qrfox/view/qr_generator.dart';


class MainDrawer extends StatefulWidget {
  static const String routeName = '/sidebar';
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white70,
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.grey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image.asset('assets/img/app_icon.png',
                      height: 110, width: 110, fit: BoxFit.cover),
              //     AuthService.user!.photoURL == null ? Image.asset('assets/images/male.png',
              //         height: 100, width: 100, fit: BoxFit.cover)
              // :Image.network(AuthService.user!.photoURL!,
              //         height: 100, width: 100, fit: BoxFit.cover),
                ),
                const SizedBox(height: 10,),
                //AuthService.user!.email!
                const Text("qrfoxinfo@gmail.com",
                  style: TextStyle(fontSize: 16,color: Colors.white),),
              ],
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
            leading: const Icon(Icons.dashboard,),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, QrScanner.routeName),
            leading: const Icon(Icons.qr_code_scanner,),
            title: const Text('QrScanner'),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, QrGenerator.routeName),
            leading: const Icon(Icons.qr_code,),
            title: const Text('Qr Generator'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => const DevInfo()));
            },
            leading: const Icon(Icons.person,),
            title: const Text('About'),
          ),
        ],
      ),
    );
  }
}
