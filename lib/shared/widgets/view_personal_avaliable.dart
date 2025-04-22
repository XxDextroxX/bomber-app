import 'package:bomber_app/models/models.dart';
import 'package:bomber_app/providers/providers.dart';
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewPersonalAvaliable extends ConsumerStatefulWidget {
  const ViewPersonalAvaliable({super.key, required this.emergencyResponses});
  final List<EmergencyResponseModel> emergencyResponses;

  @override
  ViewPersonalAvaliableState createState() => ViewPersonalAvaliableState();
}

class ViewPersonalAvaliableState extends ConsumerState<ViewPersonalAvaliable> {
  @override
  Widget build(BuildContext context) {
    final getTeamByCapitan = ref.watch(getTeamByCapitanProvider);
    return getTeamByCapitan.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final team = data[index];
            return WidgetPersonalAvaliable(
              team: team,
              emergencyResponses: widget.emergencyResponses,
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
