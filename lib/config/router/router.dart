import 'package:bomber_app/config/config.dart';
import 'package:bomber_app/models/models.dart';
import 'package:bomber_app/pages/pages.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: PathRouter.splashScreen,
  routes: [
    GoRoute(
      path: PathRouter.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: PathRouter.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: PathRouter.emergencyPage,
      builder:
          (_, state) => EmergencyPage(project: state.extra as ProjectsModel),
    ),
    GoRoute(
      path: PathRouter.privacyPolicy,
      builder: (context, state) => const PrivacyPolicy(),
    ),
    GoRoute(
      path: PathRouter.termsAndConditions,
      builder: (context, state) => const TermsAndConditions(),
    ),
    GoRoute(
      path: PathRouter.pageBox,
      builder: (context, state) => PageBox(code: state.extra as String),
    ),
  ],
);
