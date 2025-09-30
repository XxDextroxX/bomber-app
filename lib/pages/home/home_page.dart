import 'package:bomber_app/pages/home/bodyhome/body.dart';
import 'package:bomber_app/pages/pages.dart';
import 'package:bomber_app/providers/providers.dart' show loginProviderProvider;
import 'package:bomber_app/utils/utils.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    MyTeam(),
    Home(),
    ScannerBox(),
    Settings(),
  ];

  static const List<String> _titles = <String>[
    'Mi Equipo',
    'Emergencias',
    'Escanear QR',
    'Configuración',
  ];

  static const List<IconData> _icons = <IconData>[
    Icons.people_alt_rounded,
    Icons.home_rounded,
    Icons.qr_code_scanner_rounded,
    Icons.settings_rounded,
  ];

  int _page = 1;

  @override
  Widget build(BuildContext context) {
    final loginProviderNotifier = ref.watch(loginProviderProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade700, Colors.orange.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                _icons[_page],
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              _titles[_page],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.logout_rounded, color: Colors.white),
              tooltip: 'Cerrar Sesión',
              onPressed: () async {
                await loginProviderNotifier.logout(context);
                SnackbarCustom.showCustomSnackBar(
                  // ignore: use_build_context_synchronously
                  context: context,
                  message: 'Se ha cerrado sesión',
                  isNormal: true,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        height: 65,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.orange.shade600,
        color: Colors.grey.shade900,
        animationDuration: const Duration(milliseconds: 300),
        items: <Widget>[
          Icon(Icons.people_alt_rounded, size: 28, color: Colors.white),
          Icon(Icons.home_rounded, size: 28, color: Colors.white),
          Icon(Icons.qr_code_scanner_rounded, size: 28, color: Colors.white),
          Icon(Icons.settings_rounded, size: 28, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _widgetOptions[_page],
    );
  }
}