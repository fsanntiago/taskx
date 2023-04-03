// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSuccessfully extends AuthState {
  final UserEntity? user;

  const AuthSuccessfully({
    required this.user,
  });
}

class AuthFailed extends AuthState {}
