import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: context.width,
          height: context.mainHeight,
          // alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    splashRadius: 25,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Feather.arrow_left,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                sizeVer(26),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: FontSize.titleStartScreen,
                      fontWeight: FontThickness.medium,
                    ),
                  ),
                ),
                sizeVer(26),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SignUpFormWidget(),
                ),
                sizeVer(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
