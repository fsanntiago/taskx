import 'package:flutter/material.dart';
import 'package:taskX/core/utils/constants.dart';

import '../../../../../core/domain/entities/category/category_entity.dart';
import '../custom_category_card.dart';

class CategoryListWidget extends StatelessWidget {
  List<CategoryEntity> categories;

  CategoryListWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => sizeHor(18),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) => Container(
        width: 180,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: CustomCategoryCard(
          category: categories[index],
        ),
      ),
    );
  }
}
