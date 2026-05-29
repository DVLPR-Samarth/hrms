part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignInRequested extends AuthEvent {
  const AuthSignInRequested({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

final class AuthOtpSubmitted extends AuthEvent {
  const AuthOtpSubmitted({required this.otp});

  final String otp;

  @override
  List<Object> get props => [otp];
}

final class AuthOtpResendRequested extends AuthEvent {
  const AuthOtpResendRequested();
}

final class AuthEmailOtpRequested extends AuthEvent {
  const AuthEmailOtpRequested();
}

final class AuthCallOtpRequested extends AuthEvent {
  const AuthCallOtpRequested();
}
