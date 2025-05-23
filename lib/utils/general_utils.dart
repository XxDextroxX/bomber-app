import 'package:firebase_messaging/firebase_messaging.dart';

import 'services/key_value_i.dart' show KeyValuesImplementation;

class GeneralUtils {
  static deleteDataCache() async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.removeKey('token');
    await keyValueStorage.removeKey('userId');
  }

  static Future<String?> getToken() async {
    final keyValueStorage = KeyValuesImplementation();
    final token = await keyValueStorage.getValue<String>('token');
    return token;
  }

  static Future<String?> getUserId() async {
    final keyValueStorage = KeyValuesImplementation();
    final userId = await keyValueStorage.getValue<String>('userId');
    return userId;
  }

  static Future<void> setToken(String token) async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.setKeyValue('token', token);
  }

  static Future<void> setUserId(String userId) async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.setKeyValue('userId', userId);
  }

  static Future<String?> saveToken() async {
    final tokenNotifiation = await FirebaseMessaging.instance.getToken();
    return tokenNotifiation;
  }
}
