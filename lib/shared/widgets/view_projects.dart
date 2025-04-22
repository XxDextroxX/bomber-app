// lib/shared/widgets/proyectos_recientes_widget.dart
import 'package:animate_do/animate_do.dart';
import 'package:bomber_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'card_projects_recent.dart' show ProjectsRecentList;
import 'widget_card_general.dart';

class ViewProjectsWidget extends ConsumerWidget {
  const ViewProjectsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proyectosAsync = ref.watch(projectsRecentsProvider);
    final size = MediaQuery.of(context).size;
    return proyectosAsync.when(
      data: (proyectos) {
        if (proyectos.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black38, // Color inicial del gradiente.
                  Colors.transparent, // Color que se disuelve.
                ],
              ),
            ),
            width: size.width,
            height: size.height * 0.8,
            alignment: Alignment.center,
            child: Text(
              'No hay emergencias ',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(),
            ),
          );
        }
        return WidgetCardGeneral(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeartBeat(
                infinite: true,
                child: Text(
                  'Proyectos Recientes',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: proyectos.length,
                itemBuilder: (context, index) {
                  final proyecto = proyectos[index];
                  return ProjectsRecentList(proyecto: proyecto);
                },
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        print('Error en WebSocket: $error');
        return SizedBox.shrink(); // No mostrar nada en caso de error
      },
      loading: () => SizedBox.shrink(), // No mostrar nada mientras carga
    );
  }
}
