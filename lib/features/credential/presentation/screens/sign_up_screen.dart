import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:taskX/config/app_route.dart';
import 'package:taskX/core/media_query.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/app_fonts.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/features/credential/presentation/cubit/credential_cubit.dart';
import 'package:taskX/features/credential/presentation/widgets/auth_instead_of.dart';

import 'package:taskX/features/credential/presentation/widgets/sigup_form_widget.dart';

import '../../../../core/functions/build_toast.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000308),
      body: BlocListener<CredentialCubit, CredentialState>(
        listener: (context, state) {
          if (state is CredentialSignUpError) {
            buildToast(msg: state.message);
          }
          if (state is CredentialSignUpSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.home,
              (route) => false,
              arguments: state.user,
            );
          }
        },
        child: SafeArea(
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
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.chooseLoginMethod,
                          (route) => true,
                        );
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
                  sizeVer(40),
                  const Divider(
                    height: 2,
                    thickness: 1,
                    color: AppColors.darkBlueColor,
                  ),
                  sizeVer(25),
                  const AuthInsteadOf(
                    message: "Already have account? ",
                    method: "Login",
                    route: Routes.signIn,
                  ),
                  sizeVer(25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
