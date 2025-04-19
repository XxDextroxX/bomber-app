import 'package:bomber_app/models/models.dart';
import 'package:dio/dio.dart';

import 'api_config.dart' show dio;

class ApiHome {
  Future<Map<String, dynamic>> getTeamMembers(String id) async {
    try {
      final response = await dio.get(
        '/personal/integrantes/${int.tryParse(id)}',
      );

      // Caso especial: si no hay equipo asignado (status 404)
      if (response.statusCode == 404) {
        return {'ok': false, 'message': 'No tiene grupo asignado', 'code': 404};
      }

      // Parseamos los datos del equipo
      final teamData = response.data as List<dynamic>;
      final teams = teamData.map((item) => TeamModel.fromJson(item)).toList();

      return {'ok': true, 'data': teams};
    } on DioException catch (e) {
      // Manejo de errores específicos de Dio
      if (e.response?.statusCode == 404) {
        return {'ok': false, 'message': 'No tiene grupo asignado', 'code': 404};
      }
      return {
        'ok': false,
        'message': e.response?.data['message'] ?? 'Error al obtener el equipo',
        'code': e.response?.statusCode ?? 500,
      };
    } catch (e) {
      // Manejo de errores genéricos
      return {'ok': false, 'message': 'Error inesperado: $e', 'code': 500};
    }
  }
}
