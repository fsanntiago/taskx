// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_native_splash/cli_commands.dart';

import '../text_styles.dart';
import '../utils/app_colors.dart';
import '../utils/constants.dart';

class CustomSliverAppBar extends StatefulWidget {
  final bool innerBoxIsScrolled;
  final ScrollController scrollController;
  var animationTween;
  bool isScrolling;
  String title;

  CustomSliverAppBar({
    Key? key,
    required this.innerBoxIsScrolled,
    required this.scrollController,
    required this.animationTween,
    required this.isScrolling,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  bool _openFilter = false;

  void _scrollDown() {
    widget.scrollController.animateTo(
      widget.scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: widget.innerBoxIsScrolled,
      expandedHeight: _openFilter
          ? MediaQuery.of(context).size.height * 0.35
          : MediaQuery.of(context).size.height * 0.25,
      floating: false,
      pinned: true,
      scrolledUnderElevation: 0.3,
      backgroundColor: AppColors.lightBackgroundColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      toolbarHeight: (widget.innerBoxIsScrolled == true)
          ? MediaQuery.of(context).size.height * 0.08
          : MediaQuery.of(context).size.height * 0.08,
      centerTitle: false,
      leadingWidth: 0.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.innerBoxIsScrolled == true || widget.isScrolling)
            FadeTransition(
              opacity: widget.animationTween,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sizeVer(2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sizeHor(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title.capitalize(),
                            style: AppTextStyles.applicationTitle(
                              color: AppColors.blackColor,
                            ),
                          ),
                          sizeVer(2),
                          Text(
                            "02/05 ${widget.title.toLowerCase()}",
                            style: AppTextStyles.textRegular(
                              color: AppColors.darkTextSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        splashRadius: 25,
                        onPressed: () {
                          print("icon");
                        },
                        icon: const Icon(
                          Feather.search,
                          color: AppColors.blackColor,
                        ),
                      ),
                      sizeHor(12),
                      IconButton(
                        splashRadius: 25,
                        onPressed: () {
                          _scrollDown();
                          setState(
                            () {
                              _openFilter = true;
                            },
                          );
                        },
                        icon: const Icon(
                          Feather.sliders,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sizeVer(50),
              Text(
                widget.title,
                style: AppTextStyles.applicationTitle(
                  color: AppColors.blackColor,
                ),
              ),
              sizeVer(2),
              Text(
                "02/05 ${widget.title.toLowerCase()}",
                style: AppTextStyles.textRegular(
                  color: AppColors.darkTextSecondaryColor,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  // IconButton(
                  //   splashRadius: 25,
                  //   onPressed: () {
                  //     print("icon");
                  //   },
                  //   icon: const Icon(Feather.menu),
                  // ),
                  const Spacer(),
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      print("icon");
                    },
                    icon: const Icon(Feather.search),
                  ),
                  sizeHor(12),
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      setState(
                        () {
                          _openFilter = !_openFilter;
                        },
                      );
                    },
                    icon: const Icon(Feather.sliders),
                  ),
                ],
              ),
              _openFilter
                  ? Column(
                      children: [
                        sizeVer(10),
                        SizedBox(
                          height: 40,
                          child: menuFilter(),
                        ),
                      ],
                    )
                  : Container(
                      height: 0,
                    ),
              sizeVer(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuFilter() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      children: [
        Ink(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          width: 110,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                "All",
                textAlign: TextAlign.center,
                style: AppTextStyles.textMedium(color: AppColors.blackColor),
              ),
            ),
          ),
        ),
        sizeHor(20),
        Ink(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          width: 110,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                "In Progress",
                textAlign: TextAlign.center,
                style: AppTextStyles.textMedium(color: AppColors.blackColor),
              ),
            ),
          ),
        ),
        sizeHor(20),
        Ink(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          width: 110,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                "Done",
                textAlign: TextAlign.center,
                style: AppTextStyles.textMedium(color: AppColors.blackColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
