import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? backgroundColor;

  const MyButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: child,
    );
  }
}
