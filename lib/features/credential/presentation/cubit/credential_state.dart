part of 'credential_cubit.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();

  @override
  List<Object> get props => [];
}

class CredentialInitial extends CredentialState {}

class CredentialLoginLoading extends CredentialState {}

class CredentialLoginSuccess extends CredentialState {
  final UserEntity user;

  const CredentialLoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class CredentialLoginError extends CredentialState {
  final String message;

  const CredentialLoginError({required this.message});

  @override
  List<Object> get props => [message];
}
