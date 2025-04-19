import 'package:bomber_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:bomber_app/shared/widgets/widget.dart'; // Asegúrate de que esta ruta sea correcta
// Asegúrate de importar tu UserModel
// import 'path_to_your_usermodel.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  // Método para verificar si un valor no está vacío ni es nulo
  bool _isNotEmptyOrNull(dynamic value) {
    if (value == null) return false;
    if (value is String) return value.trim().isNotEmpty;
    if (value is int) return true; // Los enteros siempre se muestran si existen
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final personal = UserModel.instance.personal;

    // Lista de campos a mostrar (excluimos token y campos vacíos/nulos)
    final List<Map<String, dynamic>> userInfo = [
      {'label': 'Nombre', 'value': personal.nombre},
      {'label': 'Apellido', 'value': personal.apellido},
      {'label': 'Rol', 'value': personal.rol},
      {'label': 'Estado', 'value': personal.estado},
      {'label': 'Edad', 'value': personal.edad},
      {'label': 'Sexo', 'value': personal.sexo},
      {'label': 'CI', 'value': personal.ci},
      {'label': 'Teléfono', 'value': personal.telefono},
      {'label': 'Correo', 'value': personal.correo},
      {'label': 'Grupo Sanguíneo', 'value': personal.grupoSanguineo},
      {'label': 'Alergias', 'value': personal.alergias},
      {'label': 'Persona de Contacto', 'value': personal.personaContacto},
      {'label': 'Teléfono de Contacto', 'value': personal.telefonoContacto},
      {'label': 'Relación de Contacto', 'value': personal.relacionContacto},
      {'label': 'Certificaciones', 'value': personal.certificaciones},
      {'label': 'Entrenamientos', 'value': personal.entrenamientos},
      {'label': 'Experiencia', 'value': personal.experiencia},
      {'label': 'Disponibilidad', 'value': personal.disponibilidad},
      {'label': 'Talla de Uniforme', 'value': personal.tallaUniforme},
    ];

    // Filtramos los campos que no están vacíos ni son nulos
    final filteredInfo =
        userInfo.where((info) => _isNotEmptyOrNull(info['value'])).toList();

    return WidgetCardGeneral(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título con ícono
          Row(
            children: [
              const Icon(
                Icons.local_fire_department,
                color: Colors.red,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                'Perfil del Bombero',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Ajusta según tu tema
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Lista de información
          ...filteredInfo.map((info) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${info['label']}:',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70, // Ajusta según tu tema
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      info['value'].toString(),
                      style: const TextStyle(
                        color: Colors.white, // Ajusta según tu tema
                      ),
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
