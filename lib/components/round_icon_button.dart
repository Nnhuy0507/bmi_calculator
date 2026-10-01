import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2,
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFFE8E8EE),
      child: Icon(
        icon,
        color: Colors.black87,
      ),
    );
  }
}