import 'package:fpdart/src/either.dart';
import 'package:summertime/core/error/failure.dart';
import 'package:summertime/core/error/server_expection.dart';
import 'package:summertime/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:summertime/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource ;

  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> localStrategySignIn({required String email, required String password}) {

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> localStrategySignUp({required String name, required String email, required String password}) async{
    try {
      final userId  = await remoteDataSource.localStrategySingUp(name: name, email: email, password: password);
      return right(userId);
    } on ServerExpection catch(err){
      return left(Failure(err.message.toString())) ;
    }
    throw UnimplementedError();
  }

}