import 'package:flutter/material.dart';

class ExpenseIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      width: 36.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.red,
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Icon(Icons.arrow_downward, size: 24, color: Colors.white,),
    );
  }
}
