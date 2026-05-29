part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthOtpVerificationReady extends AuthState {
  const AuthOtpVerificationReady({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

final class AuthOtpActionReady extends AuthState {
  const AuthOtpActionReady();
}
