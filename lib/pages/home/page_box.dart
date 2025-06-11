import 'package:bomber_app/providers/providers.dart';
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageBox extends ConsumerWidget {
  const PageBox({super.key, required this.code});
  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getDataBox = ref.watch(
      getDataBoxProvider(code: code, limit: 5000, page: 1),
    );
    return Scaffold(
      appBar: AppBar(title: Text(code)),
      body: getDataBox.when(
        data: (data) {
          if (data.isEmpty) {
            return WidgetCardGeneral(
              child: const Center(child: Text('No hay datos')),
            );
          }

          return WidgetBox(data: data);
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
