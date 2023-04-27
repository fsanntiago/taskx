import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskX/features/home/presentation/cubit/home_cubit.dart';
import 'package:taskX/features/home/presentation/widgets/custom_category_card.dart';

class CategoryGridViewBuilder extends StatelessWidget {
  const CategoryGridViewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 20,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2.8),
        children: context.read<HomeCubit>().categories.map(
          (category) {
            return Container(
              child: CustomCategoryCard(
                category: category,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
