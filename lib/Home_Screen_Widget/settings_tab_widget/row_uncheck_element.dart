import 'package:flutter/material.dart';

class RowUncheckElement extends StatelessWidget {
  final String RowText;

  RowUncheckElement({required this.RowText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(RowText),
        ],
      ),
    );
  }
}
