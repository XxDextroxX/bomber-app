import 'package:bomber_app/pages/home/bodyhome/body.dart';
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
    Settings(),
  ];

  static const List<String> _titles = <String>['Mi equipo', 'Home', 'Logout'];
  int _page = 1;
  @override
  Widget build(BuildContext context) {
    final loginProviderNotifier = ref.watch(loginProviderProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_page]),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await loginProviderNotifier.logout(context);
              SnackbarCustom.showCustomSnackBar(
                // ignore: use_build_context_synchronously
                context: context,
                message: 'Se ha cerrado sesión',
                isNormal: true,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        backgroundColor: Color(0xff737373),
        buttonBackgroundColor: Colors.black,
        color: Colors.black,
        items: <Widget>[
          Icon(Icons.people, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      // body: IndexedStack(index: _page, children: _widgetOptions),
      body: _widgetOptions[_page],
    );
  }
}
