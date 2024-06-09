import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:summertime/core/common/widgets/gradient_button.dart';
import 'package:summertime/core/theme/app_pallets.dart';
import 'package:summertime/features/auth/presentation/pages/Signup_page.dart';
// import 'package:summertime/features/auth/presentation/pages/signup_page.dart'
class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailcontroller  = TextEditingController();
  final passwordcontroller  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Text("Sign In.", style:TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                )),
                const Gap(10),
                TextField(controller: emailcontroller,decoration: const InputDecoration(
                  hintText: "Email"
                ),),
                const Gap(10),
                TextField(controller: passwordcontroller,decoration: const InputDecoration(
                  hintText: "Password"
                ),),
                const Gap(20),
                GradientElevatedButton(onPressed: (){}, buttonText: "Sign In"),
                const Gap(10),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                        color: AppPallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
