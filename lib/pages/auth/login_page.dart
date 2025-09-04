import 'package:animate_do/animate_do.dart';
import 'package:bomber_app/config/config.dart';
import 'package:bomber_app/providers/providers.dart' show loginProviderProvider;
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:bomber_app/utils/utils.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.7,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(PathAssets.login), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black38, // Color inicial del gradiente.
                  Colors.transparent, // Color que se disuelve.
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                // spacing: 20,
                children: [
                  Container(
                    height: size.height * 0.6,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: size.height * 0.4,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                    ),
                    child: Column(
                      spacing: 20,
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
                                showPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                                color: Colors.black,
                              ),
                              onPressed: changeShowPassword,
                            ),
                          ),
                        ),
                        FadeInUp(
                          duration: const Duration(seconds: 1),
                          // from: 100,
                          child: CustomLoadingButton(
                            btnController: _btnController,
                            text: 'ENTRAR',
                            color: Colors.white,
                            icon: Icons.login_rounded,
                            primaryColor: seedColor,
                            onPressed: () async {
                              await loginProviderNotifier.login(context);
                              _btnController.start();
                              _btnController.reset();
                            },
                          ),
                        ),

                        // const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
