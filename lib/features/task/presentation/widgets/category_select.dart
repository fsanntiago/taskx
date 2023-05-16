import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskX/config/app_route.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/core/widget/error_message_input.dart';

class CategorySelect extends StatefulWidget {
  final List<CategoryEntity> categories;
  final void Function(String? selectedCategory) handleSelectedCategory;
  bool isValid = true;

  CategorySelect({
    super.key,
    required this.categories,
    required this.handleSelectedCategory,
    required this.isValid,
  });

  @override
  State<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Feather.list,
                size: 25,
                color: AppColors.blackColor.withOpacity(0.6),
              ),
              sizeHor(5),
              Text(
                "Select a Category",
                style: AppTextStyles.textRegularSecondary(
                  color: AppColors.blackColor.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        sizeVer(1),
        Container(
          alignment: Alignment.centerLeft,
          height: MediaQuery.of(context).size.height / 12,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              /***  Button to create new Category ***/
              if (index == 0) {
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  enableFeedback: false,
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(Routes.createCategory);
                  },
                  child: Chip(
                    padding: const EdgeInsets.all(5),
                    shape: ContinuousRectangleBorder(
                      side: BorderSide(
                        width: 1.2,
                        color: widget.isValid == false
                            ? AppColors.errorColor
                            : AppColors.darkBlueColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: Icon(
                      Feather.plus,
                      color: widget.isValid == false
                          ? AppColors.errorColor
                          : AppColors.darkBlueColor,
                    ),
                    labelStyle: AppTextStyles.subTitle(
                      color: AppColors.whiteColor,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                );
              }
              /***  Button to all categories ***/
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                enableFeedback: false,
                onTap: () {
                  setState(() {
                    _selectedItem = index - 1;
                  });
                  widget.handleSelectedCategory(
                    widget.categories[_selectedItem].uid,
                  );
                },
                child: Chip(
                  padding: const EdgeInsets.all(10),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        iconsCategory[widget.categories[index - 1].icon]!,
                        height: 24,
                        color: _selectedItem == index - 1
                            ? AppColors.whiteColor
                            : AppColors.colorsTasksAndCategories[
                                widget.categories[index - 1].color],
                      ),
                      sizeHor(12),
                      Text(widget.categories[index - 1].name!),
                    ],
                  ),
                  labelStyle: AppTextStyles.subTitle(
                    color: _selectedItem == index - 1
                        ? AppColors.whiteColor
                        : AppColors.colorsTasksAndCategories[
                            widget.categories[index - 1].color],
                  ),
                  backgroundColor: _selectedItem == index - 1
                      ? AppColors.darkBlueColor
                      : AppColors.colorsTasksAndCategories[
                              widget.categories[index - 1].color]!
                          .withOpacity(0.08),
                ),
              );
            },
            separatorBuilder: (context, index) => sizeHor(16),
            itemCount: widget.categories.length + 1,
          ),
        ),

        // Error message if a category was not selected
        widget.isValid == false
            ? const ErrorMessageInput(
                errorMessage: "Category is Required",
                paddingHorizontal: 25,
                paddingVertical: 1,
              )
            : Container(
                height: 0,
              ),
      ],
    );
  }
}
