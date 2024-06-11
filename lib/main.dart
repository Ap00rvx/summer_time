import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summertime/core/secrets/app_secret.dart';
import 'package:summertime/core/theme/theme.dart';
import 'package:summertime/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:summertime/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:summertime/features/auth/domain/usecases/user_sign_up.dart';
import 'package:summertime/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:summertime/features/auth/presentation/pages/signin_page.dart';
// import 'package:summertime/features/auth/presentation/pages/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase =
      await Supabase.initialize(url: AppSecret.url, anonKey: AppSecret.anon);
  runApp(MyApp(
    client: supabase.client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});
  final SupabaseClient client;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthBloc(
                signUp: UserSignUp(AuthRepositoryImpl(
                    AuthRemoteDataSourceImpl(client: client))))),
      ],
      child: MaterialApp(
        title: "Summer time",
        theme: AppTheme.darkThemeMode,
        debugShowCheckedModeBanner: false,
        home: const SigninPage(),
      ),
    );
  }
}
