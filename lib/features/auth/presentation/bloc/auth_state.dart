part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSuccess extends AuthState {
  final String uid;

  AuthSuccess({required this.uid});
}
final class AuthFailure extends AuthState{
  final Failure failure ;

  AuthFailure({required this.failure});
}
final class AuthLoading extends AuthState{}