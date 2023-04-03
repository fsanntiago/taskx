// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../../core/functions/convert_base64_to_image.dart';
import '../../../../core/text_styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';

class IconPicker extends StatefulWidget {
  final Function(int) callback;

  const IconPicker({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Ionicons.md_heart,
              size: 25,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            sizeHor(5),
            Text(
              "Icon",
              style: AppTextStyles.textRegularSecondary(
                color: AppColors.blackColor.withOpacity(0.6),
              ),
            ),
          ],
        ),
        sizeVer(10),
        GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 5,
            mainAxisSpacing: 3.5,
          ),
          itemCount: iconsTaskBlack.length,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                widget.callback(index);
                setState(() {
                  _selectedItem = index;
                });
              },
              child: Card(
                semanticContainer: true,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: _selectedItem == index
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: Image.memory(
                    convertBase64Image(
                      _selectedItem == index
                          ? iconsTaskWhite[index]!
                          : iconsTaskBlack[index]!,
                    ),
                    gaplessPlayback: true,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
