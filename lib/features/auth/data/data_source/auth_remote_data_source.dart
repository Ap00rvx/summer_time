

import 'package:summertime/core/error/server_expection.dart';
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
  Future<String> localStrategySingIn({required String email, required String password})async {
    throw UnimplementedError();
  }

  @override
  Future<String> localStrategySingUp({required String name, required String email, required String password})async{

    try{
      final response = await client.auth.signUp(password: password,email: email,data: {"name":name});
      if(response.user == null){
        throw ServerExpection("Error creating a user");
      }
      else{
        return response.user!.id;
      }
    }catch(err){
      throw ServerExpection(err.toString());

    }


  }

}