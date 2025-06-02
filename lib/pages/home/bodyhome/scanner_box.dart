import 'package:bomber_app/config/config.dart';
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:bomber_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScannerBox extends StatelessWidget {
  const ScannerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ScannerWidget(
      onQRViewCreated: (controller) {
        // Aquí podrías configurar la cámara u otras acciones
      },
      onScanResult: (Barcode? result) {
        if (result != null && result.code != null) {
          context.push(
            PathRouter.pageBox,
            extra: GeneralUtils.extractCode(result.code ?? ''),
          );
        }
      },
    );
  }
}
