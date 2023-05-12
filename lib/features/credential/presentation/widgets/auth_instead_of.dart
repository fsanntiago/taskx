import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';

import '../cubit/credential_cubit.dart';

class AuthInsteadOf extends StatelessWidget {
  final String route;
  final String message;
  final String method;

  const AuthInsteadOf({
    super.key,
    required this.route,
    required this.message,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoaggingIn = false;

    return BlocListener<CredentialCubit, CredentialState>(
      listener: (context, state) {
        if (state is CredentialSignUpLoading ||
            state is CredentialLoginLoading) {
          isLoaggingIn = true;
        }
        if (state is CredentialLoginError ||
            state is CredentialLoginSuccess ||
            state is CredentialSignUpError ||
            state is CredentialSignUpSuccess) {
          isLoaggingIn = false;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            style:
                AppTextStyles.textRegularSecondary(color: AppColors.whiteColor),
          ),
          InkWell(
            onTap: () {
              isLoaggingIn
                  ? null
                  : Navigator.of(context).pushNamedAndRemoveUntil(
                      route,
                      (route) => true,
                    );
            },
            child: Text(
              method,
              style: AppTextStyles.textRegularSecondary(
                  color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
