import 'package:bomber_app/models/models.dart';
import 'package:flutter/material.dart';

class WidgetPersonalAvaliable extends StatelessWidget {
  final TeamModel team;
  final List<EmergencyResponseModel> emergencyResponses;

  const WidgetPersonalAvaliable({
    super.key,
    required this.team,
    required this.emergencyResponses,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            team.nombre,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Capitán: ${team.nombreCapitan}'),
          const SizedBox(height: 16),
          const Text(
            'Integrantes:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          ...team.integrantes.map((member) {
            // Buscar coincidencia con EmergencyResponseModel
            final response = emergencyResponses.firstWhere(
              (response) => response.idPersonal == member.idPersonal,
              orElse:
                  () => EmergencyResponseModel(
                    idRespuesta: 0,
                    idEmergencia: 0,
                    idPersonal: member.idPersonal,
                    estado: -1, // Indicador de "sin respuesta"
                    fechaRespuesta: '',
                    tiempoRespuesta: 0,
                    categoria: '',
                    personal: PersonalModel(
                      idPersonal: member.idPersonal,
                      nombre: member.nombre,
                      apellido: member.apellido,
                    ),
                  ),
            );

            // Determinar el color según el estado
            Color statusColor;
            String statusText;
            switch (response.estado) {
              case 1:
                statusColor = Colors.green;
                statusText = 'Asiste';
                break;
              case 0:
                statusColor = Colors.red;
                statusText = 'No asiste';
                break;
              default:
                statusColor = Colors.yellow;
                statusText = 'Sin respuesta';
            }

            return ListTile(
              leading: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: statusColor,
                ),
              ),
              title: Text('${member.nombre} ${member.apellido}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(statusText),
                  Text('Tiempo de respuesta: ${response.tiempoRespuesta} min'),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
