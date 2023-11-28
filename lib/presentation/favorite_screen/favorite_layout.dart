import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_project/core/theme/theme_palette/default_palette.dart';
import 'package:search_project/generated/assets/assets.gen.dart';
import 'package:search_project/generated/l10n.dart';
import 'package:search_project/navigation/app_router.dart';
import 'package:search_project/presentation/home_screen/bloc/home_cubit.dart';
import 'package:search_project/widgets/organisms/list_builder.dart';
import 'package:search_project/widgets/tokens/spacing.dart';

class FavoriteLayout extends StatefulWidget {
  const FavoriteLayout({super.key});

  @override
  State<FavoriteLayout> createState() => _FavoriteLayoutState();
}

class _FavoriteLayoutState extends State<FavoriteLayout> {
  static const paddingCustom =
      EdgeInsets.only(left: Spacing.sixteen, right: Spacing.sixteen, top: 24);
  static const padding8 = EdgeInsets.all(Spacing.eight);
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.router.replace(const HomeRoute()),
          child: Padding(
            padding: padding8,
            child: Assets.images.icons.backIcon.svg(),
          ),
        ),
        backgroundColor: DefaultPalette.backgroundColor,
        centerTitle: true,
        title: Text(
          S.of(context).git_rep_list,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: paddingCustom,
            child: Column(
              children: [
                Expanded(
                  child: state.maybeWhen(
                    initial: (repo) => const Center(
                      child: Text(
                        'You have no favorites. Click on star while searching to add first favorite',
                      ),
                    ),
                    loading: () => const Column(
                      children: [
                        CupertinoActivityIndicator(),
                      ],
                    ),
                    loaded: (repositories) => Column(
                      children: [
                        if (repositories != null && repositories.isNotEmpty)
                          Expanded(
                            child: ListView.builder(
                              itemCount: repositories.length,
                              itemBuilder: (context, index) {
                                bool isFavorite = true;
                                return StatefulBuilder(
                                  builder: (
                                    BuildContext context,
                                    void Function(void Function())
                                        setStateCustom,
                                  ) {
                                    return ListBuilder(
                                      isFavorite: isFavorite,
                                      onPressed: () {
                                        if (isFavorite == true) {
                                          context
                                              .read<HomeCubit>()
                                              .deleteRepoById(
                                                repositories[index].id,
                                              );
                                        } else {
                                          context
                                              .read<HomeCubit>()
                                              .saveRepo(repositories[index]);
                                        }

                                        setStateCustom(() {
                                          isFavorite = !isFavorite;
                                        });
                                      },
                                      name: repositories[index].name,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        if (repositories == null && repositories!.isEmpty)
                          Center(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'No repositories found.',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
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
}
