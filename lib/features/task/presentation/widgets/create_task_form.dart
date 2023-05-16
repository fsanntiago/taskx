import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/models/task/task_model.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/widget/custom_form_field.dart';
import 'package:taskX/features/task/presentation/cubit/task_cubit.dart';
import 'package:taskX/features/task/presentation/widgets/category_select.dart';
import 'package:taskX/features/task/presentation/widgets/date_select.dart';

import '../../../../core/utils/constants.dart';

class CreateTaskForm extends StatefulWidget {
  final List<CategoryEntity> categories;

  const CreateTaskForm({super.key, required this.categories});

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late String? _selectedCategory =
      widget.categories.isNotEmpty ? widget.categories.first.uid : null;
  DateTime? _selectedDate;

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
    return BlocListener<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is TaskValidating) {
          setState(() {
            _autovalidateMode = AutovalidateMode.always;
          });
          if (_formKey.currentState!.validate()) {
            _createTask();
          } else {
            context.read<TaskCubit>().validateFailure();
          }
        }
      },
      child: Form(
        autovalidateMode: _autovalidateMode,
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
                textInputAction: TextInputAction.next,
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
            CategorySelect(
              categories: widget.categories,
              isValid: _autovalidateMode == AutovalidateMode.always
                  ? _selectedCategory != null
                  : true,
              handleSelectedCategory: (selectedCategory) {
                setState(() {
                  _selectedCategory = selectedCategory;
                });
              },
            ),
            sizeVer(16),
            DateSelect(
              isValid: _autovalidateMode == AutovalidateMode.always
                  ? _selectedDate != null
                  : true,
              handleSelectedDate: (selectedDate) {
                setState(() {
                  _selectedDate = selectedDate;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _createTask() {
    final task = TaskModel(
      name: _titleController.text,
      description: _descriptionController.text,
      createdAt: DateTime.now().toUtc(),
      updateAt: DateTime.now().toUtc(),
      isDeleted: false,
      category: _selectedCategory,
      dateEnd: _selectedDate,
    );
  }
}
