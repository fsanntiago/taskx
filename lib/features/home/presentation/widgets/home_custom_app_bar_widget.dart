import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:taskX/core/functions/random_emoji.dart';
import 'package:taskX/core/l10n/generated/l10n.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/app_fonts.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:badges/badges.dart' as badges;

class HomeCustomAppBarWidget extends StatelessWidget {
  HomeCustomAppBarWidget({super.key});
  final String emoji = randomEmoji();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  IntlStrings.of(context).greeting(
                    "Fabricio",
                  ),
                  style: const TextStyle(
                    fontWeight: FontThickness.bold,
                    fontSize: FontSize.title,
                    wordSpacing: -0.41,
                  ),
                ),
                Text(
                  emoji,
                  style: const TextStyle(fontSize: FontSize.subTitle),
                ),
              ],
            ),
            sizeVer(4),
            Text(
              IntlStrings.of(context).welcomeMessage,
              style: const TextStyle(
                fontSize: FontSize.body,
                color: AppColors.lightMainTextColor,
                letterSpacing: LetterSpacingCustom.letterSpacing,
              ),
            ),
          ],
        ),
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -10, end: -10),
          showBadge: true,
          ignorePointer: false,
          badgeContent: const Padding(
            padding: EdgeInsets.all(0.3),
            child: Center(
              child: Text(
                "99+",
                style: TextStyle(
                  color: AppColors.lightShapeColor,
                  fontSize: FontSize.details,
                  fontWeight: FontThickness.medium,
                  letterSpacing: LetterSpacingCustom.letterSpacing,
                ),
              ),
            ),
          ),
          badgeAnimation: const badges.BadgeAnimation.rotation(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
          badgeStyle: const badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: Colors.blue,
            // padding: EdgeInsets.all(2),
            elevation: 1,
          ),
          child: const Icon(
            Feather.bell,
            size: 26,
          ),
        ),
      ],
    );
  }
}
