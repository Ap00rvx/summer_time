import 'package:fpdart/src/either.dart';
import 'package:summertime/core/error/failure.dart';
import 'package:summertime/core/usecase/usecase.dart';
import 'package:summertime/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements Usecase<String, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.localStrategySignUp(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams(
      {required this.name, required this.email, required this.password});
}
