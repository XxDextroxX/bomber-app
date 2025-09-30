import 'package:bomber_app/config/config.dart' show PathRouter;
import 'package:bomber_app/providers/providers.dart' show loginProviderProvider;
import 'package:bomber_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart'
    show LoadingAnimationWidget;

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      init();
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  init() async {
    final loginProviderNotifier = ref.read(loginProviderProvider.notifier);
    final userId = await GeneralUtils.getUserId();
    if (userId == null) {
      // ignore: use_build_context_synchronously
      context.go(PathRouter.pageStart);
      return;
    }
    // ignore: use_build_context_synchronously
    await loginProviderNotifier.getCurrentUser(userId, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                size: 200,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'Verificando sesión....',
              style: TextStyle(fontSize: 25, fontFamily: 'NimbusSans'),
            ),
          ],
        ),
      ),
    );
  }
}
