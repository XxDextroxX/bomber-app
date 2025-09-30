import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bomber_app/config/router/path_router.dart';
import 'package:bomber_app/shared/widgets/widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.png'),
            fit: BoxFit.fitHeight,
            alignment: Alignment(-1.0, 0),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Logo en la parte superior central
              const SizedBox(height: 60),
              const Center(child: LogoWithText()),
              const Spacer(),
              // Botón de Iniciar Sesión en la parte inferior central
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(PathRouter.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
