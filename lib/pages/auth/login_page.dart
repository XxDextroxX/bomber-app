import 'package:animate_do/animate_do.dart';
import 'package:bomber_app/providers/providers.dart' show loginProviderProvider;
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  late LoadingButtonController _btnController;
  bool showPassword = false;

  @override
  void initState() {
    _btnController = LoadingButtonController();
    super.initState();
  }

  void changeShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProviderNotifier = ref.watch(loginProviderProvider.notifier);
    final loginProvider = ref.watch(loginProviderProvider);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            // Fondo similar a start_page
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo.png'),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment(-1.0, 0),
                ),
              ),
            ),
            // Contenedor gris con curva pronunciada en la parte superior
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: _CurvedTopClipper(),
                child: Container(
                  height: size.height * 0.7,
                  width: size.width,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            // Logo en la parte superior central
            const Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Center(child: LogoWithText(height: 100)),
            ),
            // Formulario de login
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 40,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeInRight(
                            duration: const Duration(seconds: 1),
                            from: 200,
                            child: CustomInputs(
                              hintText: 'Cédula',
                              textCapitalization: false,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: loginProviderNotifier.setEmail,
                              errorText: loginProvider.ci.errorMessage,
                            ),
                          ),
                          const SizedBox(height: 20),
                          FadeInLeft(
                            duration: const Duration(seconds: 1),
                            from: 200,
                            child: CustomInputs(
                              hintText: 'Contraseña',
                              maxLines: 1,
                              textCapitalization: false,
                              obscureText: !showPassword,
                              onChanged: loginProviderNotifier.setPassword,
                              errorText: loginProvider.password.errorMessage,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  showPassword
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  color: Colors.black,
                                ),
                                onPressed: changeShowPassword,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          FadeInUp(
                            duration: const Duration(seconds: 1),
                            child: CustomLoadingButton(
                              btnController: _btnController,
                              text: 'INICIAR SESIÓN',
                              color: Colors.white,
                              icon: Icons.login_rounded,
                              primaryColor: Colors.orange,
                              onPressed: () async {
                                await loginProviderNotifier.login(context);
                                _btnController.start();
                                _btnController.reset();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Comenzar desde la parte superior izquierda
    path.lineTo(0, size.height * 0.2);

    // Crear curva pronunciada hacia abajo
    path.quadraticBezierTo(
      size.width * 0.5, // Punto de control X (centro)
      size.height * 0.35, // Punto de control Y (curva pronunciada hacia abajo)
      size.width, // Punto final X
      size.height * 0.2, // Punto final Y
    );

    // Líneas hacia las esquinas inferiores
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
