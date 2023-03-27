import 'package:flutter/material.dart';
import 'package:taskX/core/media_query.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/app_fonts.dart';
import 'package:taskX/core/utils/constants.dart';

import 'package:taskX/features/credential/presentation/widgets/sigup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000308),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: context.width,
          height: context.mainHeight,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: AppColors.lightShapeColor,
                    fontSize: FontSize.titleStartScreen,
                    fontWeight: FontThickness.medium,
                  ),
                ),
                sizeVer(18),
                const SignUpFormWidget(),
                sizeVer(26),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
