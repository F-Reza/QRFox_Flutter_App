import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  static const String routeName = '/generator';
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const MainDrawer(),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCCCFF),
        centerTitle: true,
        title: const Text('Qr Generator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: controller.text,
                version: QrVersions.auto,
                size: 240.0,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(40),
              ),
              const SizedBox(height: 60,),
              SizedBox(
                width: MediaQuery.of(context).size.width -60,
                child: TextField(
                  controller: controller,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, top: 14.0),
                    fillColor: Colors.black26,
                    hintText: 'Enter your text..',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 4,
                      ),
                    ),
                    suffixIcon: TextButton(
                        onPressed: () => setState((){}),
                        child: Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 40,
                          color: Colors.grey,
                          child: const Text('GET',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
