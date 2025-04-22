// lib/providers/emergency_responses_provider.dart
import 'package:bomber_app/models/models.dart';
import 'package:bomber_app/services/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'emergency_responses_provider.g.dart';

@Riverpod(keepAlive: true)
class EmergencyResponses extends _$EmergencyResponses {
  WebSocketService? _webSocketService;

  @override
  Stream<List<EmergencyResponseModel>> build(int emergencyId, int captainId) {
    _webSocketService = WebSocketService();
    _webSocketService!.connect();
    _webSocketService!.subscribeToResponses(emergencyId, captainId);
    return _webSocketService!.responsesStream;
  }

  void disconnect() {
    _webSocketService?.disconnect();
  }
}
