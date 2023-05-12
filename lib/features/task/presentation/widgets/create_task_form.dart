import 'package:flutter/material.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/widget/custom_form_field.dart';

import '../../../../core/utils/constants.dart';
import 'category_select.dart';
import 'date_select.dart';

class CreateTaskForm extends StatefulWidget {
  final List<CategoryEntity> categories;

  const CreateTaskForm({super.key, required this.categories});

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomFormField(
              controller: _titleController,
              labelText: "Title",
              maxLength: 30,
              inputTextColor: AppColors.blackColor,
              fillColor: AppColors.whiteColor,
              labelColor: AppColors.blackColor,
              counterText:
                  '${_titleController.text.length.toString()}/${30.toString()}',
              onChanged: (value) {
                setState(() {});
              },
              validator: (String? value) {
                if (value!.isEmpty) return "Title is Required";
                return null;
              },
            ),
          ),
          sizeVer(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomFormField(
              maxLines: 4,
              maxLength: 200,
              labelText: "Description",
              inputTextColor: AppColors.blackColor,
              labelColor: AppColors.blackColor,
              fillColor: AppColors.whiteColor,
              controller: _descriptionController,
              counterText:
                  '${_descriptionController.text.length.toString()}/${200.toString()}',
              onChanged: (value) {
                setState(() {});
              },
              validator: (String? value) {
                if (value!.isEmpty) return "Description is Required";
                return null;
              },
            ),
          ),
          sizeVer(12),
          CategorySelect(categories: widget.categories),
          sizeVer(16),
          const DateSelect(),
        ],
      ),
    );
  }
}
