import 'package:flutter/material.dart';

class optionsCard extends StatelessWidget {
  const optionsCard({Key? key, required this.option, required this.color, required this.onTap}) : super(key: key);
   final String option;
   final Color color;
   final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
    child: Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    ),
    );
  }
}