

import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource{
  Future<String> localStrategySingUp({
    required String name,
    required String email ,
    required String password
});
  Future<String> localStrategySingIn({
    required String email ,
    required String password
});
}
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final SupabaseClient client ;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<String> localStrategySingIn({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<String> localStrategySingUp({required String name, required String email, required String password}) {


    throw UnimplementedError();
  }

}