import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [ViewProjectsWidget()]),
    );
  }
}
