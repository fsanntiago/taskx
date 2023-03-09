import 'package:flutter/material.dart';
import 'package:taskX/core/l10n/generated/l10n.dart';
import 'package:taskX/features/home/presentation/widgets/card_widget.dart';
import 'package:taskX/features/home/presentation/widgets/custom_title_widget.dart';

import 'card_list_widget.dart';
import 'date_widget.dart';
import 'home_custom_app_bar_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
          child: HomeCustomAppBarWidget(),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: const DateWidget(),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(top: 18, bottom: 8),
          child: CustomTitleWidget(
            title: IntlStrings.of(context).titleCategory,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CardListWidget(
            width: 140,
            height: 120,
            childItem: CardWidget(
              isClickable: false,
              isCategory: true,
              titleCategory: "31",
              backgroundColorTitleCategory: Colors.red.shade100,
              colorTitleCategory: Colors.red,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(bottom: 8),
          child: CustomTitleWidget(
              title: IntlStrings.of(context).titleTasksinProgress),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CardListWidget(
            width: 240,
            height: 160,
            childItem: CardWidget(
              isClickable: false,
              isCategory: false,
              titleCategory: "31",
              backgroundColorTitleCategory: Colors.blue.shade100,
              colorTitleCategory: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
