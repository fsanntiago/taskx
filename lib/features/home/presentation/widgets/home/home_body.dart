import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskX/core/media_query.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/features/category/presentation/cubit/category_cubit.dart';
import 'package:taskX/features/home/presentation/widgets/home/task_in_progress_list_widget.dart';

import '../../../../../core/domain/entities/user/entities/user_entity.dart';
import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/utils/app_assets_images.dart';
import '../../../../../core/utils/constants.dart';
import '../../cubit/home_cubit.dart';
import 'category_list_widget.dart';
import 'custom_title_widget.dart';
import 'date_widget.dart';
import 'home_custom_app_bar_widget.dart';

class HomeBody extends StatelessWidget {
  final UserEntity user;

  const HomeBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryCreatingSuccess) {
          context.read<HomeCubit>().homeLoadCategories();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
                child: HomeCustomAppBarWidget(user: user),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: const DateWidget(),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeCategoriesLoading) {
                    return Center(
                      heightFactor: context.height / 100,
                      child: const CircularProgressIndicator(
                        color: AppColors.darkBlueColor,
                      ),
                    );
                  }

                  if (context.read<HomeCubit>().categories.isEmpty &&
                      state is ScreenModuleChanged &&
                      state.index == 0) {
                    return Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppImages.noData,
                            height: context.height * 0.35,
                          ),
                          const Text("Nao ha nenhuma categoria ou terefa...")
                        ],
                      ),
                    );
                  }
                  if (state is HomeCategoriesLoadingSuccess &&
                          context.read<HomeCubit>().categories.isNotEmpty ||
                      state is ScreenModuleChanged && state.index == 0) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.only(top: 18, bottom: 8),
                          child: CustomTitleWidget(
                            onTap: () {
                              context
                                  .read<HomeCubit>()
                                  .changeScreenModule(index: 2);
                            },
                            title: IntlStrings.of(context).titleCategory,
                            viewAll:
                                context.read<HomeCubit>().categories.length >= 3
                                    ? true
                                    : false,
                          ),
                        ),
                        SizedBox(
                          height: 130,
                          child: CategoryListWidget(
                            categories: context.read<HomeCubit>().categories,
                          ),
                        ),
                        sizeVer(20),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.only(bottom: 8),
                          child: CustomTitleWidget(
                            onTap: () {},
                            title: IntlStrings.of(context).titleTasksinProgress,
                            viewAll:
                                context.read<HomeCubit>().categories.length >= 3
                                    ? true
                                    : false,
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: TaskInProgressListWidget(),
                        ),
                        sizeVer(20),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppImages.noData,
                            height: context.height * 0.35,
                          ),
                          const Text("Nao ha nenhuma categoria ou terefa...")
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
