import 'package:bomber_app/models/models.dart';
import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  bool _isNotEmptyOrNull(dynamic value) {
    if (value == null) return false;
    if (value is String) return value.trim().isNotEmpty;
    if (value is int) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final personal = UserModel.instance.personal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Card con avatar y nombre
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade600, Colors.red.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.shade300.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  personal.sexo?.toLowerCase() == 'masculino'
                      ? Icons.person
                      : Icons.person_outline,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${personal.nombre ?? ''} ${personal.apellido ?? ''}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      personal.rol ?? 'Bombero',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Información Personal
        _buildSectionCard(
          title: 'Información Personal',
          icon: Icons.person_outline,
          color: Colors.blue,
          items: [
            if (_isNotEmptyOrNull(personal.edad))
              _InfoItem(icon: Icons.cake_outlined, label: 'Edad', value: '${personal.edad} años'),
            if (_isNotEmptyOrNull(personal.sexo))
              _InfoItem(icon: Icons.wc, label: 'Sexo', value: personal.sexo!),
            if (_isNotEmptyOrNull(personal.ci))
              _InfoItem(icon: Icons.badge_outlined, label: 'CI', value: personal.ci!),
            if (_isNotEmptyOrNull(personal.grupoSanguineo))
              _InfoItem(icon: Icons.bloodtype_outlined, label: 'Grupo Sanguíneo', value: personal.grupoSanguineo!),
            if (_isNotEmptyOrNull(personal.estado))
              _InfoItem(icon: Icons.health_and_safety_outlined, label: 'Estado', value: personal.estado!),
          ],
        ),
        const SizedBox(height: 16),

        // Contacto
        _buildSectionCard(
          title: 'Contacto',
          icon: Icons.contact_phone_outlined,
          color: Colors.green,
          items: [
            if (_isNotEmptyOrNull(personal.telefono))
              _InfoItem(icon: Icons.phone_outlined, label: 'Teléfono', value: personal.telefono!),
            if (_isNotEmptyOrNull(personal.correo))
              _InfoItem(icon: Icons.email_outlined, label: 'Correo', value: personal.correo!),
          ],
        ),
        const SizedBox(height: 16),

        // Contacto de Emergencia
        if (_isNotEmptyOrNull(personal.personaContacto) ||
            _isNotEmptyOrNull(personal.telefonoContacto) ||
            _isNotEmptyOrNull(personal.relacionContacto))
          Column(
            children: [
              _buildSectionCard(
                title: 'Contacto de Emergencia',
                icon: Icons.emergency_outlined,
                color: Colors.red,
                items: [
                  if (_isNotEmptyOrNull(personal.personaContacto))
                    _InfoItem(icon: Icons.person_pin_outlined, label: 'Persona', value: personal.personaContacto!),
                  if (_isNotEmptyOrNull(personal.telefonoContacto))
                    _InfoItem(icon: Icons.phone_in_talk_outlined, label: 'Teléfono', value: personal.telefonoContacto!),
                  if (_isNotEmptyOrNull(personal.relacionContacto))
                    _InfoItem(icon: Icons.family_restroom_outlined, label: 'Relación', value: personal.relacionContacto!),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),

        // Información Médica
        if (_isNotEmptyOrNull(personal.alergias))
          Column(
            children: [
              _buildSectionCard(
                title: 'Información Médica',
                icon: Icons.medical_information_outlined,
                color: Colors.purple,
                items: [
                  if (_isNotEmptyOrNull(personal.alergias))
                    _InfoItem(icon: Icons.warning_amber_outlined, label: 'Alergias', value: personal.alergias!),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),

        // Capacitación y Experiencia
        if (_isNotEmptyOrNull(personal.certificaciones) ||
            _isNotEmptyOrNull(personal.entrenamientos) ||
            _isNotEmptyOrNull(personal.experiencia))
          Column(
            children: [
              _buildSectionCard(
                title: 'Capacitación y Experiencia',
                icon: Icons.school_outlined,
                color: Colors.orange,
                items: [
                  if (_isNotEmptyOrNull(personal.certificaciones))
                    _InfoItem(icon: Icons.workspace_premium_outlined, label: 'Certificaciones', value: personal.certificaciones!),
                  if (_isNotEmptyOrNull(personal.entrenamientos))
                    _InfoItem(icon: Icons.fitness_center_outlined, label: 'Entrenamientos', value: personal.entrenamientos!),
                  if (_isNotEmptyOrNull(personal.experiencia))
                    _InfoItem(icon: Icons.work_history_outlined, label: 'Experiencia', value: personal.experiencia!),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),

        // Otros Datos
        if (_isNotEmptyOrNull(personal.disponibilidad) ||
            _isNotEmptyOrNull(personal.tallaUniforme))
          _buildSectionCard(
            title: 'Otros Datos',
            icon: Icons.info_outline,
            color: Colors.teal,
            items: [
              if (_isNotEmptyOrNull(personal.disponibilidad))
                _InfoItem(icon: Icons.schedule_outlined, label: 'Disponibilidad', value: personal.disponibilidad!),
              if (_isNotEmptyOrNull(personal.tallaUniforme))
                _InfoItem(icon: Icons.checkroom_outlined, label: 'Talla Uniforme', value: personal.tallaUniforme!),
            ],
          ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required MaterialColor color,
    required List<_InfoItem> items,
  }) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.shade400, color.shade600],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      item.icon,
                      size: 20,
                      color: color.shade600,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.value,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;

  _InfoItem({required this.icon, required this.label, required this.value});
}
