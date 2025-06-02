import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({
    super.key,
    required this.onQRViewCreated,
    required this.onScanResult,
  });

  final void Function(QRViewController) onQRViewCreated;
  final void Function(Barcode?) onScanResult;

  @override
  State<ScannerWidget> createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isProcessingScan = false; // Flag to prevent multiple scans

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  this.controller = controller;
                  widget.onQRViewCreated(controller);
                  controller.scannedDataStream.listen((scanData) {
                    if (!isProcessingScan) {
                      isProcessingScan =
                          true; // Set flag to block further scans
                      widget.onScanResult(scanData);
                      controller.pauseCamera(); // Pause the camera after a scan
                    }
                  });
                },
              ),
              // Scanning aid overlay
              Center(
                child: Container(
                  width: 250, // Adjust size as needed
                  height: 250, // Adjust size as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.8),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        // Semi-transparent background outside the scan area
                        Container(color: Colors.black.withOpacity(0.5)),
                        // Transparent center for scanning
                        Center(
                          child: Container(
                            width: 200, // Inner transparent area
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(flex: 1, child: Center(child: Text('Scanear QR'))),
      ],
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Resume the camera when the widget is re-displayed
    if (isProcessingScan) {
      controller?.resumeCamera();
      isProcessingScan = false; // Reset the flag
    }
  }
}
