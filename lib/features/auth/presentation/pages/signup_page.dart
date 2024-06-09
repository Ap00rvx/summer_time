import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:summertime/core/common/widgets/gradient_button.dart';
import 'package:summertime/core/theme/app_pallets.dart';
import 'package:summertime/features/auth/presentation/pages/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailcontroller  = TextEditingController();
  final passwordcontroller  = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Text("Sign Up.", style:TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                )),
                const Gap(10),
                TextField(controller: nameController,decoration: const InputDecoration(
                    hintText: "Name"
                ),),
                const Gap(10),
                TextField(controller: emailcontroller,decoration: const InputDecoration(
                    hintText: "Email"
                ),),
                const Gap(10),
                TextField(controller: passwordcontroller,decoration: const InputDecoration(
                    hintText: "Password"
                ),),
                const Gap(20),
                GradientElevatedButton(onPressed: (){}, buttonText: "Sign Up"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign In',
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
