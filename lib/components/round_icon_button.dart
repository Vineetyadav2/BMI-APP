import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData ?icon;
  final VoidCallback ?onPressed;
  RoundedIconButton({ this.icon, this.onPressed}){}

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}