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
}
