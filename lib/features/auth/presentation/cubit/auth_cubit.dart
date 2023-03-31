// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:taskX/features/auth/domain/usecases/get_current_user_usercase.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUserUserCase getCurrentUserUserCase;

  AuthCubit({
    required this.getCurrentUserUserCase,
  }) : super(AuthInitial());

  Future<void> getUser(BuildContext context) async {
    final result = await getCurrentUserUserCase.call();
    result.fold(
      (left) => emit(AuthFailed()),
      (right) => emit(AuthSuccessfully(user: right!)),
    );
  }
}
