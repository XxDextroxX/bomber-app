class ResponseEmergencyByUser {
  int idRespuesta;
  int idEmergencia;
  int idPersonal;
  int estado;
  DateTime fechaRespuesta;
  int tiempoRespuesta;
  String categoria;
  PersonalEmergency personal;

  ResponseEmergencyByUser({
    required this.idRespuesta,
    required this.idEmergencia,
    required this.idPersonal,
    required this.estado,
    required this.fechaRespuesta,
    required this.tiempoRespuesta,
    required this.categoria,
    required this.personal,
  });

  factory ResponseEmergencyByUser.fromJson(Map<String, dynamic> json) {
    return ResponseEmergencyByUser(
      idRespuesta: json['id_respuesta'],
      idEmergencia: json['id_emergencia'],
      idPersonal: json['id_personal'],
      estado: json['estado'],
      fechaRespuesta: DateTime.parse(json['fecha_respuesta']),
      tiempoRespuesta: json['tiempo_respuesta'],
      categoria: json['categoria'],
      personal: PersonalEmergency.fromJson(json['personal']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_respuesta': idRespuesta,
      'id_emergencia': idEmergencia,
      'id_personal': idPersonal,
      'estado': estado,
      'fecha_respuesta': fechaRespuesta.toIso8601String(),
      'tiempo_respuesta': tiempoRespuesta,
      'categoria': categoria,
      'personal': personal.toJson(),
    };
  }
}

class PersonalEmergency {
  int idPersonal;
  String nombre;
  String apellido;

  PersonalEmergency({
    required this.idPersonal,
    required this.nombre,
    required this.apellido,
  });

  factory PersonalEmergency.fromJson(Map<String, dynamic> json) {
    return PersonalEmergency(
      idPersonal: json['id_personal'],
      nombre: json['nombre'],
      apellido: json['apellido'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id_personal': idPersonal, 'nombre': nombre, 'apellido': apellido};
  }
}
