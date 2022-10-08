import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final Widget text;
  final VoidCallback? onPressed;
  const BotonAzul({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
