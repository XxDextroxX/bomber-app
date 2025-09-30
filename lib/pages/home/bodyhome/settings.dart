import 'package:bomber_app/config/config.dart';
import 'package:bomber_app/models/models.dart';
import 'package:bomber_app/providers/providers.dart';
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:bomber_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProviderNotifier = ref.watch(loginProviderProvider.notifier);

    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              DeveloperFooter(),
              const SizedBox(height: 30),
              _buildSettingsCard(
                context,
                icon: Icons.privacy_tip_rounded,
                title: 'Privacidad y Políticas',
                subtitle: 'Revisa nuestras políticas de privacidad',
                color: Colors.blue,
                onTap: () => context.push(PathRouter.privacyPolicy),
              ),
              const SizedBox(height: 16),
              _buildSettingsCard(
                context,
                icon: Icons.description_rounded,
                title: 'Términos y Condiciones',
                subtitle: 'Lee los términos de uso de la aplicación',
                color: Colors.green,
                onTap: () => context.push(PathRouter.termsAndConditions),
              ),
              const SizedBox(height: 16),
              _buildDeleteCard(context, loginProviderNotifier),
              const SizedBox(height: 20),
            ],
          ),
        ),
    );
  }

  Widget _buildSettingsCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required MaterialColor color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.shade400, color.shade600],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.shade400, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteCard(
    BuildContext context,
    LoginProvider loginProviderNotifier,
  ) {
    return GestureDetector(
      onTap: () {
        CustomDialogs.generalDialog(
          context: context,
          title: 'Eliminar cuenta',
          content: '¿Estás seguro de eliminar tu cuenta?',
          onPressed: () async {
            final deleteAccount = DeleteAccount();
            final response = await deleteAccount.deleteAccount(
              UserModel.instance.personal.idPersonal.toString(),
              UserModel.instance.token,
            );
            if (response['ok'] == true) {
              SnackbarCustom.showCustomSnackBar(
                // ignore: use_build_context_synchronously
                context: context,
                message: 'Cuenta eliminada',
                isNormal: true,
              );
              // ignore: use_build_context_synchronously
              await loginProviderNotifier.logout(context);
            } else {
              SnackbarCustom.showCustomSnackBar(
                // ignore: use_build_context_synchronously
                context: context,
                message: 'Error al eliminar la cuenta',
                isNormal: false,
              );
            }
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade500, Colors.red.shade700],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade300.withOpacity(0.5),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.delete_forever_rounded,
                    color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Eliminar cuenta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Esta acción no se puede deshacer',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white70, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}