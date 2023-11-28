part of 'app_update_aware_cubit.dart';

@freezed
class AppUpdateAwareState with _$AppUpdateAwareState {
  const factory AppUpdateAwareState.initial() = Initial;
  const factory AppUpdateAwareState.hardUpdateRequired() = HardUpdateRequired;
  const factory AppUpdateAwareState.softUpdateAvailable() = SoftUpdateAvailable;
}
