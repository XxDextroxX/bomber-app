import 'package:bomber_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Política de Privacidad')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Política de Privacidad',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
              ),
              // const SizedBox(height: 8),
              // Text(
              //   'Última actualización: [Fecha]',
              //   style: GoogleFonts.nunito(
              //     fontSize: 14,
              //     color: secondaryTextColor,
              //   ),
              // ),
              const SizedBox(height: 16),
              Text(
                'Nos comprometemos a proteger la privacidad de los usuarios de esta aplicación. A continuación, explicamos qué datos recolectamos y cómo los usamos.',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('1. Información que Recopilamos'),
              _buildSectionContent(
                '- Datos personales de los usuarios autorizados (nombre, cargo, correo institucional, etc.).\n'
                '- Registros de eventos, asistencia del personal, y control de materiales.\n'
                '- Datos de uso y desempeño de la aplicación (logs, estadísticas, etc.).',
              ),
              _buildSectionTitle('2. Finalidad del Tratamiento'),
              _buildSectionContent(
                'Los datos se utilizan para:\n'
                '- Gestión operativa y administrativa del cuerpo de bomberos.\n'
                '- Mejora del servicio y toma de decisiones informadas.\n'
                '- Seguridad y auditoría de las actividades registradas.',
              ),
              _buildSectionTitle('3. Almacenamiento y Seguridad'),
              _buildSectionContent(
                'Los datos se almacenan en servidores seguros. Se aplican medidas técnicas y organizativas para proteger la información contra acceso no autorizado o pérdida.',
              ),
              _buildSectionTitle('4. Acceso y Control'),
              _buildSectionContent(
                'Solo el personal autorizado por la institución tiene acceso a la información registrada. No compartimos sus datos con terceros, salvo requerimiento legal.',
              ),
              _buildSectionTitle('5. Derechos del Usuario'),
              _buildSectionContent(
                'Usted puede solicitar en cualquier momento la revisión, corrección o eliminación de su información personal, conforme a las políticas internas del cuerpo de bomberos y la legislación aplicable.',
              ),
              _buildSectionTitle('6. Cambios en la Política'),
              _buildSectionContent(
                'Podemos actualizar esta política ocasionalmente. Cualquier cambio será informado de forma oportuna dentro de la aplicación.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: seedColor,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: GoogleFonts.nunito(fontSize: 16, color: primaryTextColor),
    );
  }
}
