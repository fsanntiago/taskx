// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';

import '../../domain/usecases/home_load_categories.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeLoadCategoriesUseCase homeLoadCategoriesUseCase;

  HomeCubit({
    required this.homeLoadCategoriesUseCase,
  }) : super(HomeInitial());

  void changeScreenModule({required int index}) {
    emit(ScreenModuleChanged(index: index));
  }

  List<CategoryEntity> _categories = [];
  List<CategoryEntity> get categories => _categories;

  Future<void> homeLoadCategories() async {
    emit(HomeCategoriesLoading());
    final result = await homeLoadCategoriesUseCase.call();
    result.fold(
      (failure) => emit(
        HomeCategoriesLoadingFailure(message: failure.message),
      ),
      (data) {
        _categories = data;
        emit(
          HomeCategoriesLoadingSuccess(categories: data),
        );
      },
    );
  }
}
