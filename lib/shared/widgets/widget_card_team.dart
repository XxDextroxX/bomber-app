import 'package:bomber_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:bomber_app/shared/widgets/widget.dart'; // Asegúrate de que esta ruta sea correcta

class WidgetCardTeam extends StatelessWidget {
  final TeamModel team;

  const WidgetCardTeam({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return WidgetCardGeneral(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título del equipo con ícono
          Row(
            children: [
              const Icon(Icons.group, color: Colors.red, size: 30),
              const SizedBox(width: 10),
              Text(
                team.nombre,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Ajusta según tu tema
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Detalles del equipo
          Text(
            'Capitán: ${team.nombreCapitan}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70, // Ajusta según tu tema
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Descripción: ${team.descripcion}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70, // Ajusta según tu tema
            ),
          ),
          const SizedBox(height: 15),
          // Lista de integrantes
          const Text(
            'Integrantes:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Ajusta según tu tema
            ),
          ),
          const SizedBox(height: 5),
          ...team.integrantes.map((member) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.yellow, // Ajusta según tu tema
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${member.nombre} ${member.apellido}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white, // Ajusta según tu tema
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
