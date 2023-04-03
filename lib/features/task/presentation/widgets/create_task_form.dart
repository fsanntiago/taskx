import 'package:flutter/material.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/widget/custom_form_field.dart';

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({super.key});

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomFormField(
            controller: _titleController,
            labelText: "Title",
            fillColor: AppColors.accentGreen,
          ),
          CustomFormField(
            labelText: "Title",
            controller: _titleController,
          ),
        ],
      ),
    );
  }
}
