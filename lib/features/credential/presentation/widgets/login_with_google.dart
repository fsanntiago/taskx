// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:taskX/core/utils/app_assets_images.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/features/credential/presentation/cubit/credential_cubit.dart';

import '../../../../core/utils/app_fonts.dart';

class LoginWithGoogle extends StatelessWidget {
  final bool? isDisable;

  const LoginWithGoogle({
    Key? key,
    this.isDisable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isDisable == true
            ? null
            : context.read<CredentialCubit>().loginWithGoogle();
      },
      style: ButtonStyle(
        fixedSize: const MaterialStatePropertyAll(
          Size.fromHeight(50),
        ),
        elevation: const MaterialStatePropertyAll(6),
        shadowColor: MaterialStatePropertyAll(
          AppColors.googleButton.withOpacity(0.4),
        ),
        backgroundColor: const MaterialStatePropertyAll(AppColors.googleButton),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              AppImages.googleIcon,
              height: 28,
              width: 28,
            ),
          ),
          const Text(
            "Continue with Google",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: FontSize.boxTitle,
              fontWeight: FontThickness.medium,
            ),
          ),
        ],
      ),
    );
  }
}
