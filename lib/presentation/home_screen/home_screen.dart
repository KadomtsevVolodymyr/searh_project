import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:search_project/domain/repository/project_repository_interface.dart';
import 'package:search_project/presentation/home_screen/bloc/home_cubit.dart';
import 'package:search_project/presentation/home_screen/home_layout.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const path = '/home_screen';

  @override
  Widget build(BuildContext context) {
    final projectRepository = Provider.of<IProjectRepository>(context);
    return BlocProvider(
      create: (context) => HomeCubit(projectRepository: projectRepository),
      child: const HomeLayout(),
    );
  }
}
