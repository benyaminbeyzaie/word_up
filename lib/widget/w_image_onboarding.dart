import 'package:flutter/material.dart';

class WImageOnBoarding extends StatelessWidget {
  final String image;
  final Widget question;

  const WImageOnBoarding({
    super.key,
    required this.image,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 350),
                child: Image.asset(image)),
          ],
        ),
        const SizedBox(height: 50),
        Expanded(
          child: question,
        )
      ],
    );
  }
}
