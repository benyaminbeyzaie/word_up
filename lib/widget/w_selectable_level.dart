import 'package:flutter/material.dart';

class WSelectableLevel extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final LevelModel model;

  const WSelectableLevel({
    super.key,
    required this.isSelected,
    required this.model,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onPressed,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  model.slug,
                  style: TextStyle(
                    color: isSelected ? Colors.white : null,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  model.name,
                  style: TextStyle(
                    color: isSelected ? Colors.white : null,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LevelModel {
  final String name;
  final String slug;
  final String description;

  LevelModel({
    required this.name,
    required this.slug,
    required this.description,
  });
}
