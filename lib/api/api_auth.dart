import 'package:bomber_app/api/api.dart' show dio;
import 'package:bomber_app/models/models.dart';
import 'package:dio/dio.dart';

class ApiAuth {
  Future<Map<String, dynamic>> login(String ci, String password) async {
    try {
      final response = await dio.post(
        '/personal/login',
        data: {'ci': ci, 'password': password},
      );

      // Verificamos que la respuesta tenga el formato esperado
      if (response.data['ok'] != true) {
        return {
          'ok': false,
          'message': response.data['message'] ?? 'Error en el login',
        };
      }

      // Parseamos los datos y actualizamos el singleton
      final userData = response.data['data'];
      final personal = Personal.fromJson(userData['personal']);
      UserModel.instance.setUser(token: userData['token'], personal: personal);

      return {'ok': true, 'data': UserModel.instance.toJson()};
    } on DioException catch (e) {
      return {
        'ok': false,
        'message': e.response?.data['message'] ?? 'Error al iniciar sesión',
        'code': e.response?.statusCode ?? 500,
      };
    } catch (e) {
      return {'ok': false, 'message': 'Error inesperado: $e', 'code': 500};
    }
  }

  Future<Map<String, dynamic>> deleteAccount(String id, String token) async {
    print('id: $id, token: $token');
    try {
      final response = await dio.delete(
        '/personal/cuenta/$id',
        options: Options(headers: {'Authorization': token}),
      );

      print('response: $response');

      // Verificamos que la respuesta tenga el formato esperado
      if (response.statusCode != 200) {
        return {
          'ok': false,
          'message': response.data['message'] ?? 'Error en el login',
        };
      }

      return {'ok': true, 'message': 'Cuenta eliminada'};
    } on DioException catch (e) {
      print('dio error: ${e.response?.data}');
      return {
        'ok': false,
        'message': e.response?.data['message'] ?? 'Error al iniciar sesión',
        'code': e.response?.statusCode ?? 500,
      };
    } catch (e) {
      print('error: $e');
      return {'ok': false, 'message': 'Error inesperado: $e', 'code': 500};
    }
  }

  Future<Map<String, dynamic>> getInformationUser(String id) async {
    try {
      final response = await dio.get('/personal/app/${int.tryParse(id)}');

      // Verificamos que la respuesta tenga el formato esperado
      if (response.data['ok'] != true) {
        return {
          'ok': false,
          'message': response.data['message'] ?? 'Error en el login',
        };
      }

      // Parseamos los datos y actualizamos el singleton
      final userData = response.data['data'];
      final personal = Personal.fromJson(userData['personal']);
      UserModel.instance.setUser(token: userData['token'], personal: personal);

      return {'ok': true, 'data': UserModel.instance.toJson()};
    } on DioException catch (e) {
      return {
        'ok': false,
        'message': e.response?.data['message'] ?? 'Error al iniciar sesión',
        'code': e.response?.statusCode ?? 500,
      };
    } catch (e) {
      return {'ok': false, 'message': 'Error inesperado: $e', 'code': 500};
    }
  }

  Future<bool> saveNotificationToken(String id, String token) async {
    try {
      final response = await dio.put(
        '/personal/notification/${int.tryParse(id)}',
        data: {'notification_token': token},
      );

      // Verificamos que la respuesta tenga el formato esperado
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }
}
