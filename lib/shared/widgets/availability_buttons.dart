// lib/shared/widgets/availability_buttons.dart
import 'package:animate_do/animate_do.dart';
import 'package:bomber_app/providers/providers.dart';
import 'package:bomber_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AvailabilityButtons extends StatelessWidget {
  final int emergencyId;
  final int personalId;
  final bool isUpdate;

  const AvailabilityButtons({
    super.key,
    required this.emergencyId,
    required this.personalId,
    this.isUpdate = false,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              if (isUpdate) {
                await updateResponse(context, 1);
              } else {
                await sendResponse(context, 1);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: const Color(0xFFFFFFFF), // primaryTextColor
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              elevation: 5,
            ),
            child: const Text(
              'Disponible',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () async {
              if (isUpdate) {
                await updateResponse(context, 0);
              } else {
                await sendResponse(context, 0);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4500), // buttonColor
              foregroundColor: const Color(0xFFFFFFFF), // primaryTextColor
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              elevation: 5,
            ),
            child: const Text(
              'No Disponible',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendResponse(BuildContext context, int status) async {
    final providerEmergency = AdminResponseEmergency();
    final response = await providerEmergency.sendRespondeEmergency(
      emergencyId,
      personalId,
      status,
    );
    if (response['ok'] == true) {
      SnackbarCustom.showCustomSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: response['message'],
        isNormal: true,
      );
    } else {
      SnackbarCustom.showCustomSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: response['message'],
        isNormal: false,
      );
    }
  }

  Future<void> updateResponse(BuildContext context, int status) async {
    final providerEmergency = AdminResponseEmergency();
    final response = await providerEmergency.updateRespondeEmergency(
      emergencyId,
      personalId,
      status,
    );
    if (response['ok'] == true) {
      SnackbarCustom.showCustomSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: response['message'],
        isNormal: true,
      );
    } else {
      SnackbarCustom.showCustomSnackBar(
        // ignore: use_build_context_synchronously
        context: context,
        message: 'error',
        isNormal: false,
      );
    }
  }
}
