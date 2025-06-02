import 'package:bomber_app/config/config.dart' show Environment;
import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
final dioContable = Dio(BaseOptions(baseUrl: Environment.apiUrlContable));
