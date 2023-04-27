import 'package:flutter/material.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/app_fonts.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/app_route.dart';
import '../../../../core/utils/app_assets_images.dart';
import '../../../../core/widget/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff000308),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset(
                AppImages.imageOnboard,
                width: 1000,
                height: 1000,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: AppColors.darkBlueColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 16,
                    right: 16,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: FontSize.titleStartScreen,
                              color: AppColors.whiteColor,
                              fontWeight: FontThickness.bold,
                              letterSpacing: LetterSpacingCustom.letterSpacing,
                            ),
                            text: "Your Daily ",
                            children: <TextSpan>[
                              TextSpan(
                                text: "Tasks ",
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              TextSpan(text: "Management"),
                            ],
                          ),
                        ),
                      ),
                      sizeVer(25),
                      const Expanded(
                        child: Text(
                          "Manage your own projects super easy. You can do scheduling, reminders, todo list and more.",
                          style: TextStyle(
                            fontSize: FontSize.subTitle,
                            color: AppColors.whiteColor,
                            fontWeight: FontThickness.light,
                            letterSpacing: LetterSpacingCustom.letterSpacing,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // sizeVer(16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: CustomButton(
                            text: "Get started",
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  Routes.chooseLoginMethod);
                            },
                          ),
                        ),
                      ),
                      sizeVer(30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
