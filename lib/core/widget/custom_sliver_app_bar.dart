// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_native_splash/cli_commands.dart';

import '../text_styles.dart';
import '../utils/app_colors.dart';
import '../utils/constants.dart';
import 'filter_menu.dart';

class CustomSliverAppBar extends StatefulWidget {
  final bool innerBoxIsScrolled;
  final ScrollController scrollController;
  var animationTween;
  bool isScrolling;
  String title;
  int totalItems;
  String? subtitle;
  bool backButton;

  CustomSliverAppBar({
    Key? key,
    required this.innerBoxIsScrolled,
    required this.scrollController,
    required this.animationTween,
    required this.isScrolling,
    required this.title,
    required this.totalItems,
    this.subtitle,
    required this.backButton,
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
      leading: widget.backButton != false
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Feather.arrow_left,
                color: AppColors.blackColor,
                size: 28,
              ),
            )
          : null,
      forceElevated: widget.innerBoxIsScrolled,
      expandedHeight: _openFilter
          ? MediaQuery.of(context).size.height * 0.35
          : MediaQuery.of(context).size.height * 0.25,
      floating: false,
      pinned: true,
      scrolledUnderElevation: 0.3,
      backgroundColor: AppColors.lightBackgroundColor,
      automaticallyImplyLeading: true,
      titleSpacing: 0.0,
      toolbarHeight: (widget.innerBoxIsScrolled == true)
          ? MediaQuery.of(context).size.height * 0.08
          : MediaQuery.of(context).size.height * 0.08,
      centerTitle: false,
      leadingWidth: widget.backButton != false ? 36.0 : 0.0,
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
                            widget.totalItems < 10
                                ? "0${widget.totalItems}/05 ${widget.subtitle ?? widget.title.toLowerCase()}"
                                : "${widget.totalItems}/05 ${widget.subtitle ?? widget.title.toLowerCase()}",
                            style: AppTextStyles.textRegular(
                              color: AppColors.darkTextSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        splashRadius: 25,
                        onPressed: () {},
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
                widget.title.capitalize(),
                style: AppTextStyles.applicationTitle(
                  color: AppColors.blackColor,
                ),
              ),
              sizeVer(2),
              Text(
                widget.totalItems < 10
                    ? "0${widget.totalItems}/05 ${widget.subtitle ?? widget.title.toLowerCase()}"
                    : "${widget.totalItems}/05 ${widget.subtitle ?? widget.title.toLowerCase()}",
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
                    onPressed: () {},
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
                          child: FilterMenu(
                            onPressAll: () {},
                            onPressDone: () {},
                            onPressInProgress: () {},
                          ),
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
}
