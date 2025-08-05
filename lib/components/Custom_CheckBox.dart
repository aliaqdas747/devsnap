import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final Color activeColor;
  final Color inactiveColor;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeIcon = Icons.electric_bolt,
    this.inactiveIcon = Icons.electric_bolt_outlined,
    this.activeColor = Colors.deepOrange,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value); // Toggle and notify the parent widget
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Circular design
          color: value ? activeColor : inactiveColor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          value ? activeIcon : inactiveIcon,
          color: value ? Colors.white : Colors.grey.shade300,
        ),
      ),
    );
  }
}
