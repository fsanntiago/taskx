import 'package:flutter/material.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/widget/custom_sliver_app_bar.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryEntity category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails>
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
      // appBar: CustomAppBar(onPressedButtonBack: () {}),
      body: SafeArea(
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
                  backButton: true,
                  totalItems: 10,
                  // widget.category.totalTasks,
                  subtitle: "Task",
                  title: widget.category.name!,
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

    //   SafeArea(
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             CustomHeader(
    //               title: category.name!,
    //               subtitle: '${category.totalTask.toString()} Tasks',
    //             ),
    //             sizeVer(16),
    //             SizedBox(
    //               height: 40,
    //               child: FilterMenu(
    //                 onPressAll: () {},
    //                 onPressDone: () {},
    //                 onPressInProgress: () {},
    //               ),
    //             ),
    //             sizeVer(20),
    //             Container(
    //               margin: const EdgeInsets.symmetric(vertical: 5),
    //               height: 170,
    //               child: CustomTaskInProgressCard(
    //                 widthPercentIndicator:
    //                     MediaQuery.of(context).size.width / 1.4,
    //                 category: category,
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  

