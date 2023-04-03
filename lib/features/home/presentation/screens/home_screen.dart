import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:taskX/config/app_route.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';

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
          floatingActionButton: SpeedDial(
            activeChild: const Icon(Feather.x),
            spaceBetweenChildren: 16,
            foregroundColor: AppColors.whiteColor,
            activeForegroundColor: AppColors.blackColor,
            activeBackgroundColor: AppColors.whiteColor,
            backgroundColor: AppColors.darkBlueColor,
            overlayColor: AppColors.whiteColor,
            overlayOpacity: 0.85,
            children: [
              SpeedDialChild(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.createCategory);
                },
                backgroundColor: AppColors.darkBlueColor,
                child: const Icon(
                  Feather.folder_plus,
                  color: AppColors.whiteColor,
                ),
                labelWidget: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Create category",
                    style: AppTextStyles.floatingButtonText(
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                ),
              ),
              SpeedDialChild(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.createTask);
                },
                backgroundColor: AppColors.darkBlueColor,
                child: const Icon(
                  Feather.file_plus,
                  color: AppColors.whiteColor,
                ),
                labelWidget: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Create task",
                    style: AppTextStyles.floatingButtonText(
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                ),
              ),
            ],
            child: const Icon(Feather.plus),
          ),
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
      default:
        return HomeBody(user: user);
    }
  }
}
