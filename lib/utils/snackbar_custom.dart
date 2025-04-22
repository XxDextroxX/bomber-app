import 'package:flutter/material.dart';

class SnackbarCustom {
  static void showCustomSnackBar({
    required BuildContext context,
    required String message,
    bool isNormal = true,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white, // Texto siempre en blanco
        ),
      ),
      backgroundColor:
          isNormal
              ? Colors.green
              : Colors.red, // Azul para normal, rojo para alerta
      duration: Duration(seconds: 3), // Duración de 3 segundos
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
