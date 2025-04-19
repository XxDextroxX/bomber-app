import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colores adaptados para la temática de bomberos
const seedColor = Color(0xFFFFD700); // Amarillo vibrante (sin cambios)
const backgroundColor = Color(0xFF2E2E2E); // Gris oscuro profesional
const primaryTextColor = Color(0xFFFFFFFF); // Blanco puro (sin cambios)
const secondaryTextColor = Color(
  0xFFD3D3D3,
); // Gris claro para mejor legibilidad
const buttonColor = Color(0xFFFF4500); // Rojo intenso (sin cambios)

class AppTheme {
  final bool isDarkmode;
  final BuildContext context;

  AppTheme({required this.isDarkmode, required this.context});

  ThemeData getTheme() => ThemeData(
    textTheme: GoogleFonts.nunitoTextTheme(
      Theme.of(context).textTheme,
    ).apply(bodyColor: primaryTextColor, displayColor: primaryTextColor),
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    listTileTheme: ListTileThemeData(
      textColor: primaryTextColor,
      iconColor: seedColor,
    ),
    appBarTheme: AppBarTheme(
      color: backgroundColor,
      iconTheme: const IconThemeData(color: seedColor),
      titleTextStyle: TextStyle(
        color: primaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w900, // Más peso para un look más fuerte
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: buttonColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: primaryTextColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Bordes más suaves
        ),
        elevation: 5, // Sombra para dar profundidad
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: buttonColor,
      foregroundColor: primaryTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
      ),
    ),
    iconTheme: const IconThemeData(color: seedColor),
    // Añadimos un estilo para los campos de texto (formularios)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800], // Fondo de los campos de texto
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: seedColor, width: 2),
      ),
      labelStyle: const TextStyle(color: secondaryTextColor),
      hintStyle: const TextStyle(color: secondaryTextColor),
    ),
    // Añadimos un estilo para los SnackBars (notificaciones)
    snackBarTheme: SnackBarThemeData(
      backgroundColor: buttonColor,
      contentTextStyle: const TextStyle(color: primaryTextColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
