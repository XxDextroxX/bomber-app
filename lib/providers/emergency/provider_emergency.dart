import 'package:bomber_app/api/api.dart';
import 'package:bomber_app/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_emergency.g.dart';

@riverpod
Future<ResponseEmergencyByUser?> getResponseEmergencyByUser(
  ref,
  int idEmergency,
  int idUser,
) async {
  final api = ApiEmergency();
  final response = await api.getResponseEmergencyByUser(idEmergency, idUser);
  if (response['ok'] == true) {
    return response['data'] as ResponseEmergencyByUser;
  } else {
    return null;
  }
}

class AdminResponseEmergency {
  Future<Map<String, dynamic>> sendRespondeEmergency(
    int idEmergency,
    int idUser,
    int status,
  ) {
    final api = ApiEmergency();
    return api.sendRespondeEmergency(idEmergency, idUser, status);
  }

  Future<Map<String, dynamic>> updateRespondeEmergency(
    int idEmergency,
    int idUser,
    int status,
  ) {
    final api = ApiEmergency();
    return api.updateRespondeEmergency(idEmergency, idUser, status);
  }
}
