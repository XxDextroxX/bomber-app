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

    return WidgetCardGeneral(
      child: Column(
        spacing: 20,
        children: [
          DeveloperFooter(),
          _btn('Privacidad y políticas', PathRouter.privacyPolicy, context),
          _btn(
            'Términos y condiciones',
            PathRouter.termsAndConditions,
            context,
          ),
          _deleteAccount('Eliminar cuenta', context, loginProviderNotifier),
        ],
      ),
    );
  }

  Widget _btn(String text, String path, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(path);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _deleteAccount(
    String text,
    BuildContext context,
    LoginProvider loginProviderNotifier,
  ) {
    return GestureDetector(
      onTap: () {
        CustomDialogs.generalDialog(
          context: context,
          title: 'Eliminar cuenta',
          content: '¿Estás seguro de eliminar tu cuenta?',
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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
