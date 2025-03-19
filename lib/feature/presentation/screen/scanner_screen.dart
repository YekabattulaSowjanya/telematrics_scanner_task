import 'package:example/feature/presentation/controller/provider.dart';
import 'package:example/feature/presentation/screen/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String? selectedOption;

  List<String> imeiOptions = [];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.blue, width: 2), // Border color and width
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Consumer<VehicleProvider>(
                  builder: (context, provider, child) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: provider.result != null
                          ? Text(
                              '${provider.result!.code}',
                              style: const TextStyle(fontSize: 25),
                            )
                          : const Text('IMEI Field'),
                    );
                  },
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),
        // QR Code Scanner Icon button
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.qr_code_scanner,
                size: 35,
              ),
              onPressed: () async {
                final scannedImei = await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const QRViewExample()),
                );
                if (scannedImei != null) {
                  setState(() {
                    imeiOptions.add(scannedImei);
                    selectedOption = scannedImei; // Set the latest scanned IMEI
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
