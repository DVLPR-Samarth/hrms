import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthOtpSubmitted>(_onOtpSubmitted);
    on<AuthOtpResendRequested>(_onOtpResendRequested);
    on<AuthEmailOtpRequested>(_onEmailOtpRequested);
    on<AuthCallOtpRequested>(_onCallOtpRequested);
  }

  void _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) {
    emit(AuthLoading());
    emit(AuthOtpVerificationReady(phoneNumber: event.phoneNumber));
  }

  void _onOtpSubmitted(AuthOtpSubmitted event, Emitter<AuthState> emit) {
    emit(const AuthOtpActionReady());
  }

  void _onOtpResendRequested(
    AuthOtpResendRequested event,
    Emitter<AuthState> emit,
  ) {
    emit(const AuthOtpActionReady());
  }

  void _onEmailOtpRequested(
    AuthEmailOtpRequested event,
    Emitter<AuthState> emit,
  ) {
    emit(const AuthOtpActionReady());
  }

  void _onCallOtpRequested(
    AuthCallOtpRequested event,
    Emitter<AuthState> emit,
  ) {
    emit(const AuthOtpActionReady());
  }
}
