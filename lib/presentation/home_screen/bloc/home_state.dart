part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({final List<GitHubRepModel>? repositories}) =
      _InitialState;

  const factory HomeState.loading() = _LoadingState;

  const factory HomeState.loaded({final List<GitHubRepModel>? repositories}) =
      LoadedState;

  const factory HomeState.error({final Object? exception}) = _ErrorState;
}
