// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CheckingCaregoryLimit extends CategoryState {}

class CheckCategoryLimitSuccess extends CategoryState {
  final bool? isInCategoryLimit;

  const CheckCategoryLimitSuccess({
    required this.isInCategoryLimit,
  });
}

class CheckCategoryLimitFailed extends CategoryState {
  final String message;
  const CheckCategoryLimitFailed({
    required this.message,
  });
}

// class CategoryInitial extends CategoryState {}

class CategoryValidating extends CategoryState {
  bool isValidate;

  CategoryValidating({this.isValidate = false});
}

class CategoryValidatingFailure extends CategoryState {}

class CategoryCreating extends CategoryState {}

class CategoryCreatingSuccess extends CategoryState {
  final CategoryEntity category;

  const CategoryCreatingSuccess({required this.category});
}

class CategoryCreatingFailure extends CategoryState {
  final String message;

  const CategoryCreatingFailure({required this.message});
}
