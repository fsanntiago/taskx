import 'package:flutter/material.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/utils/constants.dart';
import 'package:taskX/features/home/presentation/widgets/custom_task_in_progress_card.dart';

class TaskInProgressListWidget extends StatelessWidget {
  TaskInProgressListWidget({
    Key? key,
  }) : super(key: key);

  List<CategoryEntity> categories = [
    CategoryEntity(
      icon: 0,
      color: 0,
      name: "Trabalho",
    ),
    CategoryEntity(
      icon: 1,
      color: 1,
      name: "Pessoal",
    ),
    CategoryEntity(
      icon: 2,
      color: 2,
      name: "Lazer",
    ),
    CategoryEntity(
      icon: 3,
      color: 3,
      name: "Jogo",
    ),
    CategoryEntity(
      icon: 4,
      color: 4,
      name: "Pessoal",
    ),
    CategoryEntity(
      icon: 5,
      color: 5,
      name: "11",
    ),
    CategoryEntity(
      icon: 6,
      color: 1,
      name: "11",
    ),
    CategoryEntity(
      icon: 7,
      color: 0,
      name: "11",
    ),
    CategoryEntity(
      icon: 8,
      color: 3,
      name: "11",
    ),
  ];

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
        width: 280,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: CustomTaskInProgressCard(
          category: categories[index],
        ),
      ),
    );
  }
}
