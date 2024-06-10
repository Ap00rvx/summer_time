import 'package:fpdart/fpdart.dart';
import 'package:summertime/core/error/failure.dart';
// CosMicApurva@008
abstract interface class AuthRepository{
  Future<Either<Failure,String>>localStrategySignUp({
    required String name,
    required String email,
    required String password,
});
  Future<Either<Failure,String>>localStrategySignIn({
    required String email,
    required String password,
  });
}