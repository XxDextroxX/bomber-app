// lib/shared/widgets/projects_recent_list.dart
import 'package:animate_do/animate_do.dart';
import 'package:bomber_app/config/config.dart';
import 'package:bomber_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectsRecentList extends StatefulWidget {
  final ProjectsModel proyecto;

  const ProjectsRecentList({super.key, required this.proyecto});

  @override
  _ProjectsRecentListState createState() => _ProjectsRecentListState();
}

class _ProjectsRecentListState extends State<ProjectsRecentList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    // Configurar el controlador de animación
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    // Configurar la animación de color para los bordes
    _borderColorAnimation = ColorTween(
      begin: const Color(0xFFFFD700), // seedColor (amarillo vibrante)
      end: const Color(0xFFFF4500), // buttonColor (rojo intenso)
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            context.push(PathRouter.emergencyPage, extra: widget.proyecto);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: _borderColorAnimation.value ?? const Color(0xFFFFD700),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF2E2E2E).withOpacity(0.9), // backgroundColor
                  const Color(0xFF2E2E2E).withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              title: Text(
                'Evento: ${widget.proyecto.nombre}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFD700), // seedColor
                ),
              ),
              subtitle: Text(
                'Creado: ${widget.proyecto.fechaCreacion.substring(0, 10)}',
                style: TextStyle(
                  color: const Color(0xFFD3D3D3), // secondaryTextColor
                ),
              ),
              trailing: SpinPerfect(
                // duration: const Duration(seconds: 1),
                // animate: true,
                infinite: true,
                child: Icon(
                  Icons.warning_amber,
                  color: const Color(0xFFFF4500), // buttonColor
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
