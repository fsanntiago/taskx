import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskX/config/app_route.dart';
import 'package:taskX/core/functions/build_alert_dialog.dart';
import 'package:taskX/core/functions/build_toast.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/core/widget/custom_app_bar.dart';
import 'package:taskX/core/widget/custom_button.dart';
import 'package:taskX/core/widget/custom_header.dart';
import 'package:taskX/features/category/presentation/cubit/category_cubit.dart';
import 'package:taskX/features/category/presentation/widgets/create_category_form.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CheckCategoryLimitSuccess &&
            state.isInCategoryLimit == true) {
          buildAlertDialog(context, _onCategoryLimitReached(context));
        } else if (state is CheckCategoryLimitFailed) {
          Navigator.of(context).pop();
          buildToast(msg: state.message);
        }
        if (state is CategoryCreatingSuccess) {
          Navigator.of(context).popAndPushNamed(Routes.categories);
        } else if (state is CategoryCreatingFailure) {
          buildToast(msg: state.message);
        }
      },
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
              context.read<CategoryCubit>().validate();
            },
            buttonColor: AppColors.blackColor,
            textButtonColor: AppColors.whiteColor,
            shadowColor: AppColors.blackColor,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeader(title: "Create Category"),
                  sizeVer(16),
                  const CreateCategoryForm(),
                  sizeVer(70),
                ],
              ),
            ),
          ),
        ),
      ),
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
