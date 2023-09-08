import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color ?givecolor;
  final Widget ?cardChild;
  ReusableCard({this.givecolor, this.cardChild }){
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:givecolor,
      ),
      margin: EdgeInsets.all(15),
    );
  }
}