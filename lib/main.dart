import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summertime/core/secrets/app_secret.dart';
import 'package:summertime/core/theme/theme.dart';
import 'package:summertime/features/auth/presentation/pages/signin_page.dart';
import 'package:summertime/features/auth/presentation/pages/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: AppSecret.url, anonKey: AppSecret.anon).then((val)=> print("Connected to supabase"));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: "Summer time",
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false ,
      home: const SigninPage(),
    );
  }
}
