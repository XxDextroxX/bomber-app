import 'package:flutter/material.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/logo.png', width: 200, height: height ?? 130),
        // const SizedBox(height: 16),
        const Text(
          'G.E.L',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'GESTIÓN DE ESTRATEGIA',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Y LOGÍSTICA',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
