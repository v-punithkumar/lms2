import 'package:equatable/equatable.dart';
import 'package:eschool/data/repositories/authRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RequestResetPasswordState extends Equatable {}

class RequestResetPasswordInitial extends RequestResetPasswordState {
  @override
  List<Object?> get props => [];
}

class RequestResetPasswordInProgress extends RequestResetPasswordState {
  @override
  List<Object?> get props => [];
}

class RequestResetPasswordSuccess extends RequestResetPasswordState {
  @override
  List<Object?> get props => [];
}

class RequestResetPasswordFailure extends RequestResetPasswordState {
  final String errorMessage;

  RequestResetPasswordFailure(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class RequestResetPasswordCubit extends Cubit<RequestResetPasswordState> {
  final AuthRepository _authRepository;

  RequestResetPasswordCubit(this._authRepository)
      : super(RequestResetPasswordInitial());

  Future<void> requestResetPassword({
    required String grNumber,
    required DateTime dob,
  }) async {
    emit(RequestResetPasswordInProgress());
    try {
      await _authRepository.resetPasswordRequest(grNumber: grNumber, dob: dob);
      emit(RequestResetPasswordSuccess());
    } catch (e) {
      emit(RequestResetPasswordFailure(e.toString()));
    }
  }
}
