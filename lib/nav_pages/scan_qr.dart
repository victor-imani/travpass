import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travpass/business_logic/models/user.dart';
import 'package:travpass/business_logic/services/auth_service.dart';
import 'package:travpass/core/shared_pref_helper.dart';
import 'package:travpass/nav_pages/transfer_success.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({super.key});

  @override
  State<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  late Future<User?> userFuture;

  _ScanQRPageState() {
    userFuture = getUserDetails();
  }

  Future<User?> getUserDetails() async {
    return SharedPrefHelper(await SharedPreferences.getInstance())
        .getUserDetails();
  }

  bool isScanCompleted = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;

  MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return FutureBuilder<User?>(
      future: userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            User user = snapshot.data!;
            return Scaffold(
              backgroundColor: const Color(0xFF0B2031),
              body: Container(
                width: width,
                height: height,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Color(0xFF0B2031)),
                child: Stack(
                  children: [
                    Positioned(
                      left: -381,
                      top: -575,
                      child: Container(
                        width: 1080,
                        height: 1920,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/background.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 45,
                      top: height - 820,
                      child: const Center(
                        child: Column(
                          children: [
                            Text(
                              'Scanning QR Code',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900,
                                height: 0,
                              ),
                            ),
                            Text(
                              'Place the QR Code in the area',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: height - 650,
                      right: 0,
                      bottom: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            MobileScanner(
                              controller: controller,
                              onDetect: (capture) async {
                                if (!isScanCompleted) {
                                  final List<Barcode> barcodes =
                                      capture.barcodes;
                                  String scanResult = '';
                                  // Extract JSON data from the "rawValue" field
                                  scanResult = barcodes[0].rawValue ?? '';
                                  try {
                                    Map<String, dynamic> decodedResult =
                                        jsonDecode(scanResult);

                                    String conductorID =
                                        decodedResult["conductorID"].toString();
                                    double amount =
                                        double.parse(decodedResult["amount"]);
                                    String routeName =
                                        decodedResult["routeName"];

                                    Map<String, dynamic> body = {
                                      'conductorID': conductorID,
                                      'fareValue': amount,
                                      'passengerID': user.id,
                                      'routeName': routeName,
                                    };

                                    String result =
                                        await Provider.of<AuthService>(context,
                                                listen: false)
                                            .initiateTransaction(body);

                                    isScanCompleted = true;

                                    if (result == "ok") {
                                      controller.dispose();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TransferSuccess(
                                              scanResults:
                                                  decodedResult['amount']),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            result,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    // Handle the case when JSON decoding fails
                                    print('Error decoding JSON: $e');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Invalid QR Code format.',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                            QRScannerOverlay(
                              overlayColor: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 100,
                        top: height - 200,
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: IconButton(
                                          iconSize: 40,
                                          onPressed: () {
                                            setState(() {
                                              isFlashOn = !isFlashOn;
                                            });
                                            controller.toggleTorch();
                                          },
                                          icon: Icon(Icons.flash_on,
                                              color: isFlashOn
                                                  ? Colors.blue
                                                  : Colors.grey)),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: IconButton(
                                          iconSize: 40,
                                          onPressed: () {
                                            setState(() {
                                              isFrontCamera = !isFrontCamera;
                                            });
                                            controller.switchCamera();
                                          },
                                          icon: Icon(
                                              Icons.camera_front_outlined,
                                              color: isFrontCamera
                                                  ? Colors.blue
                                                  : Colors.grey)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          } else {
            // Handle the case when user information is not available
            return const Scaffold(
              body: Center(
                child: Text('User information not available.'),
              ),
            );
          }
        } else {
          // Handle loading state
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
