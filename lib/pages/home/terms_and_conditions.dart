import 'package:bomber_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Términos y Condiciones')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Términos y Condiciones de Uso',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Última actualización: [Fecha]',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: secondaryTextColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Bienvenido/a. Esta aplicación está diseñada exclusivamente para el uso operativo y administrativo de cuerpos de bomberos, facilitando la gestión de eventos, control del personal, inventario de materiales y otras tareas relacionadas con la labor de emergencia y prevención.',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('1. Aceptación de los Términos'),
              _buildSectionContent(
                'Al acceder y utilizar esta aplicación, usted acepta cumplir con estos Términos y Condiciones. Si no está de acuerdo con alguna parte, debe abstenerse de usar la aplicación.',
              ),
              _buildSectionTitle('2. Uso Autorizado'),
              _buildSectionContent(
                'La aplicación está destinada únicamente a personal autorizado del cuerpo de bomberos. Está prohibido el uso con fines ilícitos o no relacionados con la operación institucional.',
              ),
              _buildSectionTitle('3. Registro y Seguridad'),
              _buildSectionContent(
                'El acceso a determinadas funciones requiere un registro previo. Usted es responsable de mantener la confidencialidad de sus credenciales de acceso.',
              ),
              _buildSectionTitle('4. Uso de Datos'),
              _buildSectionContent(
                'Conforme a lo establecido, la información registrada (eventos, personal, materiales, etc.) será almacenada y utilizada únicamente para fines operativos, estadísticos y de mejora del servicio interno.',
              ),
              _buildSectionTitle('5. Propiedad Intelectual'),
              _buildSectionContent(
                'Todo el contenido, diseño y funcionalidades de la aplicación son propiedad del desarrollador o de la institución correspondiente y están protegidos por las leyes de propiedad intelectual.',
              ),
              _buildSectionTitle('6. Responsabilidad'),
              _buildSectionContent(
                'La aplicación es una herramienta de apoyo y no sustituye el juicio profesional ni los protocolos de emergencia. El desarrollador no se hace responsable por decisiones operativas basadas exclusivamente en la aplicación.',
              ),
              _buildSectionTitle('7. Modificaciones'),
              _buildSectionContent(
                'Nos reservamos el derecho de modificar estos términos en cualquier momento. Le notificaremos sobre los cambios a través de la aplicación o por otros medios pertinentes.',
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
