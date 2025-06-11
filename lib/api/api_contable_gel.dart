import 'package:bomber_app/api/api.dart';
import 'package:bomber_app/models/models.dart';
import 'package:dio/dio.dart';

class ApiContableGel {
  Future<Map<String, dynamic>> getResponseEmergencyByUser({
    required String code,
    int limit = 10,
    int page = 1,
  }) async {
    print('code: $code, limit: $limit, page: $page');
    try {
      final response = await dioContable.post(
        '/lots/productsapp?limit=$limit&page=$page',
        data: {'code': code, "password": "bokuyaba"},
      );

      print('test: ${response.data}');
      // final responseData = response as Map<String, dynamic>;
      // print('responseData: $responseData');
      final data = BoxModel.fromJson(response.data);

      return {'ok': true, 'data': data};
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
        'message': e.response?.data['error'] ?? 'Error al obtener el equipo',
        'code': e.response?.statusCode ?? 500,
      };
    } catch (e) {
      print('error: $e');
      // Manejo de errores genéricos
      return {'ok': false, 'message': 'Error inesperado: $e', 'code': 500};
    }
  }
}
