import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskX/core/widget/custom_sliver_app_bar.dart';
import 'package:taskX/features/category/presentation/cubit/category_cubit.dart';
import 'package:taskX/features/home/presentation/cubit/home_cubit.dart';

import 'category_grid_view_bluider.dart';

class CategoriesBuilder extends StatefulWidget {
  const CategoriesBuilder({super.key});

  @override
  State<CategoriesBuilder> createState() => _CategoriesBuilderState();
}

class _CategoriesBuilderState extends State<CategoriesBuilder>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  var _animationTween;
  var _animationController;

  bool _isScrolling = false;

  void _scrollListener() {
    setState(() {
      _isScrolling = _scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 3;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    if (_animationController != null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategoryCreatingSuccess) {
            context.read<HomeCubit>().homeLoadCategories();
          }
        },
        child: SafeArea(
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              if (innerBoxIsScrolled || _isScrolling) {
                /* Animation */
                _animationController = AnimationController(
                  vsync: this,
                  duration: const Duration(
                    seconds: 1,
                  ),
                );
                _animationTween = Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(_animationController);
                /* Animation */
                _animationController.forward();
              }
              return [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: CustomSliverAppBar(
                    backButton: false,
                    totalItems: context.read<HomeCubit>().categories.length,
                    title: "Categories",
                    innerBoxIsScrolled: innerBoxIsScrolled,
                    animationTween: _animationTween,
                    isScrolling: _isScrolling,
                    scrollController: _scrollController,
                  ),
                ),
              ];
            },
            body:
                // Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                // child:

                Builder(
              builder: (context) {
                return CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                    ),
                    const CategoryGridViewBuilder(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
