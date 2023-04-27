import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskX/features/category/domain/usecases/create_category_usecase.dart';
import 'package:taskX/features/category/domain/usecases/is_in_categories_limit_usecase.dart';

import '../../../../core/domain/entities/category/category_entity.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CreateCategoryUseCase createCategoryUseCase;
  final IsInCategoriesLimitUseCase isInCategoriesLimitUseCase;

  CategoryCubit({
    required this.createCategoryUseCase,
    required this.isInCategoriesLimitUseCase,
  }) : super(CategoryInitial());

  validate() {
    emit(CategoryValidating());
  }

  void validateFailure() {
    emit(CategoryValidatingFailure());
  }

  Future<void> isInCategoryLimit() async {
    final result = await isInCategoriesLimitUseCase.call();
    print(result);
    result.fold(
      (failure) => emit(
        CheckCategoryLimitFailed(message: failure.message),
      ),
      (result) => emit(
        CheckCategoryLimitSuccess(isInCategoryLimit: result),
      ),
    );
  }

  Future<void> createCategory(CategoryEntity category) async {
    final result = await createCategoryUseCase.call(category);
    result.fold(
      (failure) => emit(
        CategoryCreatingFailure(message: failure.message),
      ),
      (categoryResult) => emit(
        CategoryCreatingSuccess(category: categoryResult),
      ),
    );
  }
}
