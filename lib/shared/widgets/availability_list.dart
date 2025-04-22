// lib/shared/widgets/availability_list.dart
import 'package:animate_do/animate_do.dart';
import 'package:bomber_app/providers/projects/emergency_responses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view_personal_avaliable.dart' show ViewPersonalAvaliable;
import 'widget_card_general.dart';

class AvailabilityList extends ConsumerWidget {
  final int emergencyId;
  final int captainId;

  const AvailabilityList({
    super.key,
    required this.emergencyId,
    required this.captainId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emergencyResponsesAsync = ref.watch(
      emergencyResponsesProvider(emergencyId, captainId),
    );

    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: WidgetCardGeneral(
        child: emergencyResponsesAsync.when(
          data: (respuestas) {
            if (respuestas.isEmpty) {
              return const Center(
                child: Text(
                  'No hay respuestas registradas',
                  style: TextStyle(
                    color: Color(0xFFD3D3D3),
                  ), // secondaryTextColor
                ),
              );
            }
            return ViewPersonalAvaliable(emergencyResponses: respuestas);
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text(
                'Error loading responses',
                style: TextStyle(color: Color(0xFFD3D3D3)),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
