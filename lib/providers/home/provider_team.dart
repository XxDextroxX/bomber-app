import 'package:bomber_app/api/api.dart';
import 'package:bomber_app/models/models.dart';
import 'package:bomber_app/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_team.g.dart';

@riverpod
Future<List<TeamModel>> getTeamByCapitan(Ref ref) async {
  final apiHome = ApiHome();
  final idUser = await GeneralUtils.getUserId();
  final response = await apiHome.getTeamMembers(idUser ?? '');
  print('response: $response');
  if (response['ok'] == true) {
    return response['data'] as List<TeamModel>;
  } else {
    return [];
  }
}
