import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrScanner extends StatefulWidget {
  static const String routeName = '/scanner';
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;


  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const MainDrawer(),
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: const Color(0xFFCCCCFF),
        centerTitle: true,
        title: const Text('Qr Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async{
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    icon: Icon(Icons.flash_off,size: 35,),
                  ),
                  //const SizedBox(width: 5,),
                  IconButton(
                    onPressed: () async{
                      await controller?.flipCamera();
                      setState(() {});
                    },
                    icon: Icon(Icons.flip_camera_ios,size: 35,),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderWidth: 10,
                  //borderRadius: 10,
                  //borderLength: 20,
                  //borderColor: Theme.of(context).canvasColor,
                  cutOutSize: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.black26,
                height: 100,
                child: Center(
                  child: (result != null)
                      ? Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.9,
                          color: Colors.blueGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                          'Barcode Type: ${describeEnum(result!.format)}\nData: ${result!.code}'),
                        ),
                      )
                      : Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.9,
                          color: Colors.blueGrey,
                        child: const Text('Scan a code', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {

    //setState(() => this.controller = controller);

    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
