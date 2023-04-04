import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/category/category_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widget/custom_form_field.dart';
import '../cubit/category_cubit.dart';
import 'color_picker.dart';
import 'icon_picker.dart';

class CreateCategoryForm extends StatefulWidget {
  const CreateCategoryForm({
    super.key,
  });

  @override
  State<CreateCategoryForm> createState() => _CreateCategoryFormState();
}

class _CreateCategoryFormState extends State<CreateCategoryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  int colorCategory = 0;
  int iconCategory = 0;

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
    return BlocListener<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryValidating) {
          if (_formKey.currentState!.validate()) {
            _createCategory();
          } else {
            context.read<CategoryCubit>().validateFailure();
          }
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomFormField(
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
            sizeVer(16),
            CustomFormField(
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
            sizeVer(12),
            ColorPicker(
              callback: (indexColor) {
                setState(() {
                  colorCategory = indexColor;
                });
              },
            ),
            sizeVer(20),
            IconPicker(
              callback: (indexIcon) {
                setState(() {
                  iconCategory = indexIcon;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  _createCategory() {
    CategoryModel category = CategoryModel(
      color: colorCategory,
      createdAt: DateTime.now().toUtc(),
      description: _descriptionController.text,
      icon: iconCategory,
      name: _titleController.text,
      updateAt: DateTime.now().toUtc(),
    );

    context.read<CategoryCubit>().createCategory(category);

    _clear();
  }

  _clear() {
    setState(() {
      _descriptionController.clear();
      _titleController.clear();
    });
  }
}
