import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/constants.dart';

class ColorPicker extends StatefulWidget {
  final Function(int) callback;

  const ColorPicker({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Ionicons.md_color_palette,
              size: 25,
              color: AppColors.blackColor.withOpacity(0.6),
            ),
            sizeHor(5),
            Text(
              "Color",
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
          itemCount: AppColors.colorsTask.length,
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
                shadowColor: AppColors.colorsTask[index]!.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: AppColors.colorsTask[index],
                child: _selectedItem == index
                    ? const SizedBox(
                        child: Icon(
                          Feather.check,
                          size: 29,
                          color: AppColors.whiteColor,
                        ),
                      )
                    : Container(
                        height: 0,
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}
