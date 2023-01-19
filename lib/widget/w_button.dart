import 'package:flutter/material.dart';

class WButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Size minimumSize;
  final double radius;

  const WButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.minimumSize = const Size(300, 50),
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? Theme.of(context).colorScheme.secondary,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(12),
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            return const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            );
          },
        ),
        minimumSize: MaterialStateProperty.all(
          minimumSize,
        ),
      ),
      child: Text(title),
    );
  }
}
