import 'package:flutter/material.dart';
import 'package:taskX/core/utils/app_colors.dart';

import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightBackgroundColor,
        body: SingleChildScrollView(
          child: HomeBody(),
        ),
      ),
    );
  }
}
