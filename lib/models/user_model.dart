class UserModel {
  // Propiedades
  String token;
  Personal personal;

  // Instancia privada para el singleton
  static final UserModel _instance = UserModel._internal();

  // Constructor privado
  UserModel._internal()
    : token = '',
      personal = Personal(
        idPersonal: 0,
        nombre: '',
        apellido: '',
        rol: '',
        estado: '',
        edad: 0,
        sexo: '',
        ci: '',
        telefono: '',
        correo: '',
        grupoSanguineo: '',
        alergias: '',
        personaContacto: '',
        telefonoContacto: '',
        relacionContacto: '',
        certificaciones: '',
        entrenamientos: '',
        experiencia: '',
        disponibilidad: '',
        tallaUniforme: '',
      );

  // Getter para obtener la instancia única
  static UserModel get instance => _instance;

  // Método para establecer los datos del usuario
  void setUser({required String token, required Personal personal}) {
    this.token = token;
    this.personal = personal;
  }

  // Método para limpiar la sesión
  void clearSession() {
    token = '';
    personal = Personal(
      idPersonal: 0,
      nombre: '',
      apellido: '',
      rol: '',
      estado: '',
      edad: 0,
      sexo: '',
      ci: '',
      telefono: '',
      correo: '',
      grupoSanguineo: '',
      alergias: '',
      personaContacto: '',
      telefonoContacto: '',
      relacionContacto: '',
      certificaciones: '',
      entrenamientos: '',
      experiencia: '',
      disponibilidad: '',
      tallaUniforme: '',
      notificationToken: null,
    );
  }

  // Método para verificar si hay un usuario autenticado
  bool get isAuthenticated => token.isNotEmpty;

  // Factory para parsear desde JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel._internal()
      ..token = json['token'] ?? ''
      ..personal = Personal.fromJson(json['personal'] ?? {});
  }

  // Método para convertir a JSON
  Map<String, dynamic> toJson() {
    return {'token': token, 'personal': personal.toJson()};
  }
}

class Personal {
  final int idPersonal;
  final String nombre;
  final String apellido;
  final String rol;
  final String estado;
  final int edad;
  final String sexo;
  final String ci;
  final String telefono;
  final String correo;
  final String grupoSanguineo;
  final String alergias;
  final String personaContacto;
  final String telefonoContacto;
  final String relacionContacto;
  final String certificaciones;
  final String entrenamientos;
  final String experiencia;
  final String disponibilidad;
  final String tallaUniforme;
  String? notificationToken;

  Personal({
    required this.idPersonal,
    required this.nombre,
    required this.apellido,
    required this.rol,
    required this.estado,
    required this.edad,
    required this.sexo,
    required this.ci,
    required this.telefono,
    required this.correo,
    required this.grupoSanguineo,
    required this.alergias,
    required this.personaContacto,
    required this.telefonoContacto,
    required this.relacionContacto,
    required this.certificaciones,
    required this.entrenamientos,
    required this.experiencia,
    required this.disponibilidad,
    required this.tallaUniforme,
    this.notificationToken,
  });

  factory Personal.fromJson(Map<String, dynamic> json) {
    return Personal(
      idPersonal: json['id_personal'] ?? 0,
      nombre: json['nombre'] ?? '',
      apellido: json['apellido'] ?? '',
      rol: json['rol'] ?? '',
      estado: json['estado'] ?? '',
      edad: json['edad'] ?? 0,
      sexo: json['sexo'] ?? '',
      ci: json['ci'] ?? '',
      telefono: json['telefono'] ?? '',
      correo: json['correo'] ?? '',
      grupoSanguineo: json['grupo_sanguineo'] ?? '',
      alergias: json['alergias'] ?? '',
      personaContacto: json['persona_contacto'] ?? '',
      telefonoContacto: json['telefono_contacto'] ?? '',
      relacionContacto: json['relacion_contacto'] ?? '',
      certificaciones: json['certificaciones'] ?? '',
      entrenamientos: json['entrenamientos'] ?? '',
      experiencia: json['experiencia'] ?? '',
      disponibilidad: json['disponibilidad'] ?? '',
      tallaUniforme: json['talla_uniforme'] ?? '',
      notificationToken: json['notification_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_personal': idPersonal,
      'nombre': nombre,
      'apellido': apellido,
      'rol': rol,
      'estado': estado,
      'edad': edad,
      'sexo': sexo,
      'ci': ci,
      'telefono': telefono,
      'correo': correo,
      'grupo_sanguineo': grupoSanguineo,
      'alergias': alergias,
      'persona_contacto': personaContacto,
      'telefono_contacto': telefonoContacto,
      'relacion_contacto': relacionContacto,
      'certificaciones': certificaciones,
      'entrenamientos': entrenamientos,
      'experiencia': experiencia,
      'disponibilidad': disponibilidad,
      'talla_uniforme': tallaUniforme,
      'notification_token': notificationToken,
    };
  }
}
