// lib/providers/proyectos_recientes_provider.dart
import 'package:bomber_app/models/models.dart';
import 'package:bomber_app/services/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'projects_provider.g.dart';

@Riverpod(keepAlive: true)
class ProjectsRecents extends _$ProjectsRecents {
  WebSocketService? _webSocketService;

  @override
  Stream<List<ProjectsModel>> build() {
    _webSocketService = WebSocketService();
    _webSocketService!.connect();
    return _webSocketService!.projectsStream;
  }

  void disconnect() {
    _webSocketService?.disconnect();
  }
}
