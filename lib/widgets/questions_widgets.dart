import 'package:flutter/material.dart';

class QuestionWidiget extends StatelessWidget {
  const QuestionWidiget({
    Key? key,
    required this.question,
    required this.indexAction,
    required this.totalQuestions,
    })
    : super(key: key);

 final String question;
 final int totalQuestions;
 final int indexAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(' ${indexAction + 1}/$totalQuestions-pergunta: $question', 
      style: TextStyle(
        fontSize: 24,
        color: Colors.white
      ),),
    
    );
  }
}