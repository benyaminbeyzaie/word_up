import 'package:flutter/material.dart';

class WSelectableItem extends StatelessWidget {
  final SelectableModel model;
  final bool isSelected;
  final VoidCallback onPressed;

  const WSelectableItem({
    Key? key,
    required this.isSelected,
    required this.model,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            isSelected ? Theme.of(context).colorScheme.primary : Colors.white,
      ),
      child: InkWell(
        onTap: onPressed,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 50, maxWidth: 50),
                  child: Image.asset(
                    model.image,
                    color: isSelected ? Colors.white : null,
                  ),
                ),
              ),
            ),
            Text(
              model.label,
              style: TextStyle(
                color: isSelected ? Colors.white : null,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

class SelectableModel {
  final String label;
  final String image;

  SelectableModel({
    required this.image,
    required this.label,
  });
}
