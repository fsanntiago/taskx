// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:taskX/features/home/presentation/cubit/home_cubit.dart';
import 'package:taskX/features/home/presentation/widgets/home_bottom_nav_bar.dart';

import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  final UserEntity user;

  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is ScreenModuleChanged;
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: state is! ScreenModuleChanged
                ? HomeBody(user: user)
                : _getHomeBodyModule(state.index),
          ),
          bottomNavigationBar: const HomeBottomNavBar(),
        );
      },
    );
  }

  Widget _getHomeBodyModule(int index) {
    switch (index) {
      case 0:
        return HomeBody(user: user);
      case 1:
      case 2:
      case 3:
      case 4:
      default:
        return HomeBody(user: user);
    }
  }
}
