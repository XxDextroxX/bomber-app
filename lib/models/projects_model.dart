// lib/models/proyecto_model.dart
class ProjectsModel {
  final int idProyecto;
  final String nombre;
  final String? descripcion;
  final int? idEmergencia;
  final String? fechaInicio;
  final String? fechaFin;
  final String fechaCreacion;

  ProjectsModel({
    required this.idProyecto,
    required this.nombre,
    this.descripcion,
    this.idEmergencia,
    this.fechaInicio,
    this.fechaFin,
    required this.fechaCreacion,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) {
    return ProjectsModel(
      idProyecto: json['id_proyecto'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      idEmergencia: json['id_emergencia'],
      fechaInicio: json['fecha_inicio'],
      fechaFin: json['fecha_fin'],
      fechaCreacion: json['fecha_creacion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_proyecto': idProyecto,
      'nombre': nombre,
      'descripcion': descripcion,
      'id_emergencia': idEmergencia,
      'fecha_inicio': fechaInicio,
      'fecha_fin': fechaFin,
      'fecha_creacion': fechaCreacion,
    };
  }
}
