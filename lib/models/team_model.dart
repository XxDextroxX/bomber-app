class TeamModel {
  final int idGrupo;
  final String nombre;
  final int idCapitan;
  final String nombreCapitan;
  final String descripcion;
  final List<MemberModel> integrantes;

  TeamModel({
    required this.idGrupo,
    required this.nombre,
    required this.idCapitan,
    required this.nombreCapitan,
    required this.descripcion,
    required this.integrantes,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      idGrupo: json['id_grupo'] ?? 0,
      nombre: json['nombre'] ?? '',
      idCapitan: json['id_capitan'] ?? 0,
      nombreCapitan: json['nombre_capitan'] ?? '',
      descripcion: json['descripcion'] ?? '',
      integrantes:
          (json['integrantes'] as List<dynamic>?)
              ?.map(
                (item) => MemberModel.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_grupo': idGrupo,
      'nombre': nombre,
      'id_capitan': idCapitan,
      'nombre_capitan': nombreCapitan,
      'descripcion': descripcion,
      'integrantes': integrantes.map((member) => member.toJson()).toList(),
    };
  }
}

class MemberModel {
  final int idPersonal;
  final String nombre;
  final String apellido;

  MemberModel({
    required this.idPersonal,
    required this.nombre,
    required this.apellido,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      idPersonal: json['id_personal'] ?? 0,
      nombre: json['nombre'] ?? '',
      apellido: json['apellido'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id_personal': idPersonal, 'nombre': nombre, 'apellido': apellido};
  }
}
