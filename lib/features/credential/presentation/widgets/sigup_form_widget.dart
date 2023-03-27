import 'package:flutter/material.dart';
import 'package:taskX/config/app_route.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/core/widget/custom_button.dart';
import 'package:taskX/core/widget/form_field.dart';

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
            controller: _nameController,
            labelText: "Name",
            textInputAction: TextInputAction.next,
          ),
          sizeVer(16),
          CustomFormField(
            controller: _emailController,
            labelText: "Email",
            textInputAction: TextInputAction.next,
          ),
          sizeVer(16),
          CustomFormField(
            isPasswordField: true,
            labelText: "Password",
            controller: _passwordController,
            textInputAction: TextInputAction.done,
          ),
          sizeVer(24),
          CustomButton(
            text: "Get Started",
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
          )
        ],
      ),
    );
  }
}
