import 'package:bomber_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperFooter extends StatelessWidget {
  const DeveloperFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo animado
          _buildAnimatedLogo(),
          const SizedBox(height: 12),
          // Texto "Desarrollado por McKakos"
          Text(
            'Desarrollado por',
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: secondaryTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'McKakos',
            style: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: seedColor,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          // Botón de contacto o enlace
          ElevatedButton.icon(
            onPressed: () {
              _launchUrl('https://mckakos.com/');
            },
            icon: const Icon(Icons.link, size: 20),
            label: Text(
              'Visita McKakos',
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: primaryTextColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildAnimatedLogo() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.9, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: seedColor.withOpacity(0.2),
          border: Border.all(color: seedColor, width: 2),
        ),
        child: Center(
          // Placeholder para el logo (reemplaza con el logo real de McKakos)
          child: Text(
            'M',
            style: GoogleFonts.nunito(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: seedColor,
            ),
          ),
        ),
      ),
    );
  }
}
