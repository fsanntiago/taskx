// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ScreenModuleChanged extends HomeState {
  final int index;

  const ScreenModuleChanged({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}

class HomeCategoriesLoading extends HomeState {}

class HomeCategoriesLoadingSuccess extends HomeState {
  final List<CategoryEntity> categories;

  const HomeCategoriesLoadingSuccess({required this.categories});

  @override
  List<Object> get props => [categories];
}

class HomeCategoriesLoadingFailure extends HomeState {
  final String message;

  const HomeCategoriesLoadingFailure({required this.message});
}
