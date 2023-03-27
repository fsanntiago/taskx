// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taskX/features/credential/domain/entities/user_entity.dart';
import 'package:taskX/features/home/presentation/widgets/home_bottom_nav_bar.dart';

import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  final UserEntity user;

  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: HomeBody(user: user),
        ),
      ),
    );
  }
}
