import 'package:bomber_app/models/models.dart';
import 'package:dio/dio.dart';

import 'api_config.dart' show dio;

class ApiEmergency {
  Future<Map<String, dynamic>> getResponseEmergencyByUser(
    int idEmergency,
    int idUser,
  ) async {
    try {
      final response = await dio.get(
        '/respuesta_emergencia/respuesta?id_emergencia=$idEmergency&id_personal=$idUser',
      );

      final responseEmergency = response.data as Map<String, dynamic>;
      final data = ResponseEmergencyByUser.fromJson(responseEmergency);

      return {'ok': true, 'data': data};
    } on DioException catch (e) {
      // Manejo de errores específicos de Dio
      if (e.response?.statusCode == 404) {
        return {
          'ok': false,
          'message': 'No existe respuesta de emergencia',
          'code': 404,
        };
      }
      return {
        'ok': false,
        'message': e.response?.data['error'] ?? 'Error al obtener el equipo',
        'code': e.response?.statusCode ?? 500,
      };
    } catch (e) {
      // Manejo de errores genéricos
      return {'ok': false, 'message': 'Error inesperado: $e', 'code': 500};
    }
  }

  Future<Map<String, dynamic>> sendRespondeEmergency(
    int idEmergency,
    int idUser,
    int status,
  ) async {
    print('idEmergency: $idEmergency, idUser: $idUser, status: $status');
    try {
      final response = await dio.post(
        '/respuesta_emergencia',
        data: {
          'id_emergencia': idEmergency,
          'id_personal': idUser,
          'estado': status,
        },
      );

      if (response.statusCode == 201) {
        return {'ok': true, 'message': 'Respuesta enviada'};
      } else {
        return {'ok': false, 'message': response.data['error']};
      }
    } on DioException catch (e) {
      print('dio error: ${e.response?.data}');
      // Manejo de errores específicos de Dio
      if (e.response?.statusCode == 404) {
        return {
          'ok': false,
          'message': 'No existe respuesta de emergencia',
          'code': 404,
        };
      }
      return {
        'ok': false,
        'message': e.response?.data['error'] ?? 'Error desconocido',
        'code': e.response?.statusCode ?? 500,
      };
    } catch (e) {
      // Manejo de errores genéricos
      return {'ok': false, 'message': 'Error inesperado: $e', 'code': 500};
    }
  }

  Future<Map<String, dynamic>> updateRespondeEmergency(
    int idEmergency,
    int idUser,
    int status,
  ) async {
    try {
      final response = await dio.patch(
        '/respuesta_emergencia/respuesta',
        data: {
          'id_emergencia': idEmergency,
          'id_personal': idUser,
          'estado': status,
        },
      );

      if (response.statusCode == 200) {
        return {'ok': true, 'message': 'Respuesta actualizada'};
      } else {
        return {'ok': false, 'message': response.data['error']};
      }
    } on DioException catch (e) {
      print('dio error: ${e.response?.data}');
      // Manejo de errores específicos de Dio
      if (e.response?.statusCode == 404) {
        return {
          'ok': false,
          'message': 'No existe respuesta de emergencia',
          'code': 404,
        };
      }
      return {
        'ok': false,
        'message': e.response?.data['error'] ?? 'Error desconocido',
        'code': e.response?.statusCode ?? 500,
      };
    } catch (e) {
      print('error: $e');
      // Manejo de errores genéricos
      return {'ok': false, 'message': 'Error inesperado: $e', 'code': 500};
    }
  }
}
