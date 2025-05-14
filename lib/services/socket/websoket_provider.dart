// lib/services/websocket_service.dart
import 'dart:async';
import 'package:bomber_app/models/models.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WebSocketService {
  final urlSocket = "https://www.api.bombero.mckakos.com";
  // final urlSocket = "http://192.168.0.4:3005";
  IO.Socket? _socket;
  final _projectsController = StreamController<List<ProjectsModel>>.broadcast();
  final _responsesController =
      StreamController<List<EmergencyResponseModel>>.broadcast();

  Stream<List<ProjectsModel>> get projectsStream => _projectsController.stream;
  Stream<List<EmergencyResponseModel>> get responsesStream =>
      _responsesController.stream;

  void connect() {
    _socket = IO.io(urlSocket, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socket!.connect();

    _socket!.on('connect', (_) {
      print('Connected to WebSocket');
    });

    _socket!.on('proyectos_recientes', (data) {
      final projects =
          (data as List).map((json) => ProjectsModel.fromJson(json)).toList();
      _projectsController.add(projects);
    });

    _socket!.on('disconnect', (_) {
      print('Disconnected from WebSocket');
    });
  }

  void subscribeToResponses(int emergencyId, int captainId) {
    _socket!.emit('subscribe_respuestas', {
      'id_emergencia': emergencyId,
      'id_capitan': captainId,
    });

    _socket!.on('respuestas_emergencia_$emergencyId', (data) {
      final responses =
          (data as List)
              .map((json) => EmergencyResponseModel.fromJson(json))
              .toList();
      _responsesController.add(responses);
    });
  }

  void disconnect() {
    _socket?.disconnect();
    _projectsController.close();
    _responsesController.close();
  }
}
