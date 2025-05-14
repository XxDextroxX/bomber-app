import 'package:bomber_app/providers/providers.dart';
import 'package:bomber_app/shared/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTeam extends ConsumerWidget {
  const MyTeam({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTeamByCapitan = ref.watch(getTeamByCapitanProvider);
    return WidgetCardGeneral(
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            UserProfileCard(),
            getTeamByCapitan.when(
              data: (data) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final team = data[index];
                    return WidgetCardTeam(team: team);
                  },
                );
              },
              error: (error, stackTrace) {
                print('error: $error');
                return Text(error.toString());
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
