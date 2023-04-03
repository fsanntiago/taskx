import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:taskX/core/functions/random_emoji.dart';
import 'package:taskX/core/l10n/generated/l10n.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/app_fonts.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';

class HomeCustomAppBarWidget extends StatelessWidget {
  final UserEntity user;

  HomeCustomAppBarWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  IntlStrings.of(context).greeting(
                    user.name!.substring(0, user.name!.indexOf(" ")),
                  ),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2.6),
                  child: Text(
                    emoji,
                    style: const TextStyle(
                      fontSize: FontSize.boxTitle,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            sizeVer(4),
            Text(
              IntlStrings.of(context).onboardMessage,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: -10, end: -10),
          showBadge: true,
          ignorePointer: false,
          badgeContent: Padding(
            padding: const EdgeInsets.all(0.3),
            child: Center(
              child: Text(
                "99+",
                style: Theme.of(context).textTheme.titleSmall,
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
            badgeColor: AppColors.primaryColor,
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
