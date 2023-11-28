import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_project/data/model/git_hub_rep_model.dart';
import 'package:search_project/presentation/home_screen/bloc/home_cubit.dart';
import 'package:search_project/widgets/organisms/list_builder.dart';
import 'package:search_project/widgets/tokens/spacing.dart';

class HomeInitial extends StatefulWidget {
  const HomeInitial({super.key, required this.repositories});
  final List<GitHubRepModel> repositories;

  static const spacing20 = SizedBox(
    height: Spacing.twenty,
  );

  @override
  State<HomeInitial> createState() => _HomeInitialState();
}

class _HomeInitialState extends State<HomeInitial> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Search History',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        HomeInitial.spacing20,
        Expanded(
          child: ListView.builder(
            itemCount: widget.repositories.length,
            itemBuilder: (context, index) {
              bool isFavorite = false;
              return StatefulBuilder(
                builder: (
                  BuildContext context,
                  void Function(void Function()) setStateCustom,
                ) {
                  return ListBuilder(
                    isFavorite: isFavorite,
                    onPressed: () {
                      onFavoritePressed(
                        isFavorite,
                        widget.repositories,
                        index,
                      );
                      setStateCustom(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    name: widget.repositories[index].name,
                  );
                },
              );
            },
          ),
        ),
      ],
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
