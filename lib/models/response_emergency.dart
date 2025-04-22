// lib/models/respuesta_emergencia_model.dart
class EmergencyResponseModel {
  final int idRespuesta;
  final int idEmergencia;
  final int idPersonal;
  final int estado; // 0: no asiste, 1: asiste
  final String fechaRespuesta;
  final int tiempoRespuesta;
  final String categoria;
  final PersonalModel personal;

  EmergencyResponseModel({
    required this.idRespuesta,
    required this.idEmergencia,
    required this.idPersonal,
    required this.estado,
    required this.fechaRespuesta,
    required this.tiempoRespuesta,
    required this.categoria,
    required this.personal,
  });

  factory EmergencyResponseModel.fromJson(Map<String, dynamic> json) {
    return EmergencyResponseModel(
      idRespuesta: json['id_respuesta'],
      idEmergencia: json['id_emergencia'],
      idPersonal: json['id_personal'],
      estado: json['estado'],
      fechaRespuesta: json['fecha_respuesta'],
      tiempoRespuesta: json['tiempo_respuesta'],
      categoria: json['categoria'],
      personal: PersonalModel.fromJson(json['personal']),
    );
  }
}

class PersonalModel {
  final int idPersonal;
  final String nombre;
  final String apellido;

  PersonalModel({
    required this.idPersonal,
    required this.nombre,
    required this.apellido,
  });

  factory PersonalModel.fromJson(Map<String, dynamic> json) {
    return PersonalModel(
      idPersonal: json['id_personal'],
      nombre: json['nombre'],
      apellido: json['apellido'],
    );
  }
}
