import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_project/data/model/git_hub_rep_model.dart';
import 'package:search_project/domain/entities/result.dart';
import 'package:search_project/domain/repository/project_repository_interface.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.projectRepository})
      : super(const HomeState.initial());
  final IProjectRepository projectRepository;

  LoadedState loadedState = const LoadedState();

  Future<void> getHistory() async {
    emit(const HomeState.loading());
    final repos = await projectRepository.getHistory();
    emit(HomeState.initial(repositories: repos));
  }

  Future<void> searchRepository(String text) async {
    emit(const HomeState.loading());
    final Result<List<GitHubRepModel>> result =
        await projectRepository.searchRep(text);
    await result.maybeWhen(
      orElse: () {
        emit(const HomeState.error());
      },
      success: (data) async {
        loadedState = loadedState.copyWith(repositories: data);
        await projectRepository.saveHistory(data[0]);
        emit(loadedState);
      },
    );
  }

  Future<void> saveRepo(GitHubRepModel repo) async {
    await projectRepository.saveRepo(repo);
  }

  Future<void> getAllRepos() async {
    emit(const HomeState.loading());
    final repos = await projectRepository.getRepos();
    loadedState = loadedState.copyWith(repositories: repos);
    emit(loadedState);
  }

  Future<void> deleteRepoById(int id) async {
    await projectRepository.deleteRepoById(id);
  }
}
