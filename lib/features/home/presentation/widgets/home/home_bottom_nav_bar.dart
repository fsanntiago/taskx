import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/features/home/presentation/cubit/home_cubit.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ScreenModuleChanged) {
          indexSelected = state.index;
        }
      },
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: indexSelected,
          items: [
            _bottomNavigationIcon(Feather.grid, "Home"),
            _bottomNavigationIcon(Icons.calendar_month_outlined, "Calender"),
            _bottomNavigationIcon(Feather.file_text, "Tasks"),
            _bottomNavigationIcon(Feather.user, "Profile"),
          ],
          onTap: (index) {
            setState(() {
              indexSelected = index;
            });
            context.read<HomeCubit>().changeScreenModule(index: index);
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.whiteColor,
        );
      },
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
