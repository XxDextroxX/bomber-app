// lib/screens/emergency_page.dart
import 'package:bomber_app/models/models.dart';
import 'package:bomber_app/providers/providers.dart';
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmergencyPage extends ConsumerWidget {
  final ProjectsModel project;

  const EmergencyPage({super.key, required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = UserModel.instance;
    final idPersonal = userModel.personal.idPersonal;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Emergencia: ${project.nombre}',
          maxLines: 2,
          style: const TextStyle( color: Color(0xFFFFFFFF)), // primaryTextColor
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            WidgetCardGeneral(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marcar disponibilidad',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFD700), // seedColor
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buttons(ref, idPersonal),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            AvailabilityList(
              emergencyId: project.idProyecto,
              captainId: idPersonal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttons(WidgetRef ref, int idPersonal) {
    final getResponseEmergencyByUser = ref.watch(
      getResponseEmergencyByUserProvider(project.idProyecto, idPersonal),
    ); //

    return getResponseEmergencyByUser.when(
      data: (data) {
        if (data != null) {
          return Column(
            spacing: 10,
            children: [
              Text(
                'Asistencia ya registrada, actualizar estado',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AvailabilityButtons(
                emergencyId: project.idProyecto,
                personalId: idPersonal,
                isUpdate: true,
              ),
            ],
          );
        } else {
          print('Send');
          return AvailabilityButtons(
            emergencyId: project.idProyecto,
            personalId: idPersonal,
            isUpdate: false,
          );
        }
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
