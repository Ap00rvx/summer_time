import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:summertime/core/error/failure.dart';
import 'package:summertime/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _signUp ;
  AuthBloc({required  UserSignUp signUp}) :_signUp = signUp, super(AuthInitial()) {
    on<AuthSignUp>((event, emit)async  {
      emit(AuthLoading());
      final response = await _signUp(UserSignUpParams(email: event.email,name: event.name,password: event.password,));
      response.fold((l)=>emit(AuthFailure(failure: l)), (r)=>emit(AuthSuccess(uid: r)));
    });
  }
}
