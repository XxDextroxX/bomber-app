import 'package:bomber_app/api/api.dart';
import 'package:bomber_app/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_contable.g.dart';

@riverpod
Future<List<DataBox>> getDataBox(
  ref, {
  required String code,
  int limit = 10,
  int page = 1,
}) async {
  if (code.isEmpty) {
    return Future.value([]);
  }
  final api = ApiContableGel();
  final response = await api.getResponseEmergencyByUser(
    code: code,
    limit: limit,
    page: page,
  );

  if (response['ok'] == true) {
    final box = response['data'] as BoxModel;
    return box.data;
  } else {
    return [];
  }
}
