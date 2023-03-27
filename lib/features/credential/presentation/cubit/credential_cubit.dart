// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';

import 'package:taskX/features/credential/domain/usecases/login_with_google_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  LoginWithGoogleUseCase loginWithGoogleUseCase;

  CredentialCubit({
    required this.loginWithGoogleUseCase,
  }) : super(CredentialInitial());

  Future<void> loginWithGoogle() async {
    emit(CredentialLoginLoading());
    final result = await loginWithGoogleUseCase.call();
    result.fold(
        (failure) => emit(CredentialLoginError(message: failure.message)),
        (success) => emit(CredentialLoginSuccess(user: success)));
  }
}
