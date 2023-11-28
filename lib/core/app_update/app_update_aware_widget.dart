import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_project/core/app_update/app_update_aware_cubit.dart';

class AppUpdateAware extends StatelessWidget {
  const AppUpdateAware({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUpdateAwareCubit, AppUpdateAwareState>(
      builder: (context, state) {
        _showNotification(context, state);

        return child;
      },
    );
  }

  Future<void> _showNotification(
    BuildContext context,
    AppUpdateAwareState state,
  ) =>
      Future.delayed(
        const Duration(milliseconds: 500),
        () => state.whenOrNull(
          softUpdateAvailable: () async {
            await BlocProvider.of<AppUpdateAwareCubit>(context)
                .confirmUserNotified();
            return;
          },
        ),
      );
}
