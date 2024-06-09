import 'package:flutter/material.dart';
import 'package:summertime/core/theme/app_pallets.dart';

class GradientElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Gradient gradient;

  const GradientElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.gradient = const LinearGradient(
      colors: [AppPallete.gradient1,AppPallete.gradient2,AppPallete.gradient3],
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}