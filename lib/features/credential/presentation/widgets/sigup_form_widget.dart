import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/core/widget/custom_button.dart';
import 'package:taskX/core/widget/custom_form_field.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:taskX/features/credential/presentation/cubit/credential_cubit.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSigningUp = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
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
            readOnly: _isSigningUp == true ? true : false,
            controller: _nameController,
            labelText: "Name",
            maxLength: 120,
            textInputAction: TextInputAction.next,
            validator: (String? value) {
              if (value!.isEmpty) return "Name is Required";
              return null;
            },
          ),
          sizeVer(10),
          CustomFormField(
            readOnly: _isSigningUp == true ? true : false,
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
            readOnly: _isSigningUp == true ? true : false,
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
                  text: "Get Started",
                  onPressed: () {
                    _signUpUser();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  _signUpUser() {
    if (_formKey.currentState!.validate()) {
      UserEntity user = UserEntity(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      );
      setState(() {
        _isSigningUp = true;
      });
      context
          .read<CredentialCubit>()
          .signUp(user: user)
          .then((value) => _clear());
    }
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _nameController.clear();
      _passwordController.clear();
      _isSigningUp = false;
    });
  }
}
