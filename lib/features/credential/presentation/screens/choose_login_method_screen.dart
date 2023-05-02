import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:taskX/config/app_route.dart';
import 'package:taskX/core/functions/build_toast.dart';
import 'package:taskX/core/utils/app_assets_images.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/core/widget/custom_button.dart';
import 'package:taskX/features/credential/presentation/cubit/credential_cubit.dart';
import 'package:taskX/features/credential/presentation/widgets/login_with_google.dart';
import 'package:taskX/features/credential/presentation/widgets/or_separator.dart';

class ChooseLoginMethodScreen extends StatefulWidget {
  const ChooseLoginMethodScreen({super.key});

  @override
  State<ChooseLoginMethodScreen> createState() =>
      _ChooseLoginMethodScreenState();
}

class _ChooseLoginMethodScreenState extends State<ChooseLoginMethodScreen> {
  bool _isDisable = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CredentialCubit, CredentialState>(
      listener: (context, state) {
        if (state is CredentialLoginError) {
          buildToast(msg: state.message);
          setState(() {
            _isDisable = false;
          });
        }
        if (state is CredentialLoginSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.home,
            (route) => false,
            arguments: state.user,
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0x00000000),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.appLogo,
                  // width: 200,
                  // height: 200,
                  alignment: Alignment.topCenter,
                  scale: 4,
                ),
                sizeVer(60),
                BlocBuilder<CredentialCubit, CredentialState>(
                  builder: (context, state) {
                    if (state is CredentialLoginLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is CredentialLoginSuccess) {
                      return const LoginWithGoogle(
                        isDisable: true,
                      );
                    } else {
                      return const LoginWithGoogle();
                    }
                  },
                ),
                sizeVer(26),
                const OrSeparator(
                  text: "or",
                  color: AppColors.whiteColor,
                ),
                sizeVer(26),
                BlocListener<CredentialCubit, CredentialState>(
                  listener: (context, state) {
                    if (state is CredentialLoginLoading) {
                      setState(() {
                        _isDisable = true;
                      });
                    }
                    if (state is CredentialLoginSuccess ||
                        state is CredentialLoginError) {
                      setState(() {
                        _isDisable = true;
                      });
                    }
                  },
                  child: CustomButton(
                    text: "Continue with Email",
                    isDisable: _isDisable,
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.signUp,
                      );
                    },
                    icon: Feather.mail,
                    textButtonColor: AppColors.blackColor,
                    buttonColor: AppColors.primaryColor,
                    shadowColor: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
