import 'package:flutter/material.dart';
import 'package:quiz_tupas/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      
      return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text('Next Questions', 
      textAlign: TextAlign.center,
      ),

    );
   
  }
}