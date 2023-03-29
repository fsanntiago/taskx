import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/core/widget/custom_button.dart';
import 'package:taskX/core/widget/form_field.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:taskX/features/credential/presentation/cubit/credential_cubit.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSigningIn = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormField(
            readOnly: _isSigningIn == true ? true : false,
            controller: _emailController,
            labelText: "Email",
            maxLength: 80,
            textInputAction: TextInputAction.next,
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Email is Required";
              } else if (!EmailValidator.validate(value)) {
                return "Email is Invalid";
              }
              return null;
            },
          ),
          sizeVer(10),
          CustomFormField(
            readOnly: _isSigningIn == true ? true : false,
            isPasswordField: true,
            labelText: "Password",
            maxLength: 90,
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            validator: (String? value) {
              if (value!.isEmpty) return "Password is Required";
              return null;
            },
          ),
          sizeVer(20),
          BlocBuilder<CredentialCubit, CredentialState>(
            builder: (context, state) {
              if (state is CredentialSignUpLoading) {
                return const CircularProgressIndicator();
              } else {
                return CustomButton(
                  text: "Login",
                  onPressed: () {
                    _signInUser();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  _signInUser() {
    if (_formKey.currentState!.validate()) {
      UserEntity user = UserEntity(
        email: _emailController.text,
        password: _passwordController.text,
      );
      setState(() {
        _isSigningIn = true;
      });
      context
          .read<CredentialCubit>()
          .signIn(user: user)
          .then((value) => _clear());
    }
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
      _isSigningIn = false;
    });
  }
}
