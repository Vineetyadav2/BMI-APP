import 'package:flutter/material.dart';
import '../constants.dart';

class iconContent extends StatelessWidget {
  final IconData ?icon;
  final String ?label;
  iconContent({this.icon, this.label}){}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label!,
          style: labelTextStyle,
        ),
      ],
    );
  }
}