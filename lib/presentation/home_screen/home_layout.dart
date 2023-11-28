import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_project/core/theme/theme_palette/default_palette.dart';
import 'package:search_project/data/model/git_hub_rep_model.dart';
import 'package:search_project/generated/assets/assets.gen.dart';
import 'package:search_project/generated/l10n.dart';
import 'package:search_project/navigation/app_router.dart';
import 'package:search_project/presentation/home_screen/bloc/home_cubit.dart';
import 'package:search_project/presentation/home_screen/home_initial.dart';
import 'package:search_project/presentation/home_screen/home_loaded.dart';
import 'package:search_project/widgets/organisms/custom_text_field.dart';
import 'package:search_project/widgets/tokens/spacing.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  static const spacing16 = SizedBox(
    height: Spacing.sixteen,
  );
  static const paddingCustom =
      EdgeInsets.only(left: Spacing.sixteen, right: Spacing.sixteen, top: 24);

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultPalette.backgroundColor,
        centerTitle: true,
        title: Text(
          S.of(context).git_rep_list,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          GestureDetector(
            child: Assets.images.icons.favorite.image(),
            onTap: () => context.router.navigate(const FavoriteRoute()),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: paddingCustom,
            child: Column(
              children: [
                CustomTextField(
                  onSend: (text) =>
                      context.read<HomeCubit>().searchRepository(text),
                  placeholder: 'Search',
                  startIcon: Assets.images.icons.search.svg(),
                  endIcon: Assets.images.icons.close.svg(),
                  isEnabled: true,
                ),
                spacing16,
                Expanded(
                  child: state.maybeWhen(
                    initial: (repositories) =>
                        HomeInitial(repositories: repositories ?? []),
                    loading: () => const Column(
                      children: [
                        CupertinoActivityIndicator(),
                      ],
                    ),
                    loaded: (repositories) => HomeLoaded(
                      repositories: repositories ?? [],
                    ),
                    error: (error) => Center(
                      child: Text('$error'),
                    ),
                    orElse: () => const Center(
                      child: Text('text'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onFavoritePressed(
    bool isFavorite,
    List<GitHubRepModel>? repositories,
    int index,
  ) {
    if (isFavorite == true) {
      context.read<HomeCubit>().deleteRepoById(
            repositories![index].id,
          );
    } else {
      context.read<HomeCubit>().saveRepo(repositories![index]);
    }
  }
}
