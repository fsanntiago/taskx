import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/core/widget/custom_app_bar.dart';
import 'package:taskX/core/widget/custom_button.dart';
import 'package:taskX/core/widget/custom_header.dart';
import 'package:taskX/features/home/presentation/cubit/home_cubit.dart';
import 'package:taskX/features/task/presentation/cubit/task_cubit.dart';
import 'package:taskX/features/task/presentation/widgets/create_task_form.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: CustomAppBar(
              onPressedButtonBack: () {
                Navigator.of(context).pop();
              },
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
              child: CustomButton(
                text: "Create",
                onPressed: () {
                  context.read<TaskCubit>().validate();
                },
                buttonColor: AppColors.blackColor,
                textButtonColor: AppColors.whiteColor,
                shadowColor: AppColors.blackColor,
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CustomHeader(title: "Create new Task"),
                    ),
                    sizeVer(16),
                    CreateTaskForm(
                      categories: context.read<HomeCubit>().categories,
                    ),
                    sizeVer(MediaQuery.of(context).size.height / 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _onCategoryLimitReached(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/warning.svg",
              height: 200,
            ),
            Text(
              "You can't create any more categories",
              style: AppTextStyles.subTitleBold(),
              textAlign: TextAlign.center,
            ),
            sizeVer(16),
            Text(
              "You already have the limit of 5 categories created.",
              style: AppTextStyles.textRegularSecondary(),
              textAlign: TextAlign.center,
            ),
            sizeVer(20),
            CustomButton(
              text: "Ok, got it",
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              buttonColor: const Color(0xffFFC000),
              shadowColor: const Color(0xffFFC000),
            ),
          ],
        ),
      ),
    );
  }
}
