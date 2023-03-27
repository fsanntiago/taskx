import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:taskX/core/utils/app_colors.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _bottomNavigationIcon(Feather.grid, "Home"),
        _bottomNavigationIcon(Feather.file_text, "Tasks"),
        _bottomNavigationIcon(Feather.plus_square, "Add Tasks"),
        _bottomNavigationIcon(Icons.calendar_month_outlined, "Calender"),
        _bottomNavigationIcon(Feather.user, "Profile"),
      ],
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.whiteColor,
    );
  }

  BottomNavigationBarItem _bottomNavigationIcon(IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
        ),
        label: label);
  }
}
