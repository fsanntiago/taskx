import 'package:flutter/material.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/core/widget/custom_app_bar.dart';
import 'package:taskX/core/widget/custom_header.dart';
import 'package:taskX/features/task/presentation/widgets/create_task_form.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar(
          onPressedButtonBack: () {
            Navigator.of(context).pop();
          },
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: "Create Task"),
                sizeVer(20),
                const CreateTaskForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => const AlertDialog(title: Text("haha")),
    );
  }
}
