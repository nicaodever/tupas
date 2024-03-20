import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_tupas/constants.dart';
import 'package:quiz_tupas/modules/db_firebase.dart';
import 'package:quiz_tupas/widgets/Bt_next.dart';
import '../modules/questions_module.dart';
import '../widgets/questions_widgets.dart';
import '../widgets/options.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);
  
  @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = DbFirebase();
  late Future _questions;

  Future<List<Question>> getData() async {
    return db.pegarQuestao();
  }

@override
void initState(){
  _questions = getData();
  super.initState();
}

   int index = 0;
   bool isPressed = false;

  void nextQuestion(int questionLength){
    if(index == questionLength - 1){
      return;
    }
    else{
     setState(() {
      index++;
      isPressed = false;
    });
    }
   
  }
  void changeColor(){
    setState(() {
      isPressed = true;
    });
  }
  
  
  @override
  Widget build(BuildContext context) {

   return FutureBuilder(
    future: _questions as Future<List<Question>>,
    builder: (ctx, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        if(snapshot.hasError){
          return Center(
            child: Text('${snapshot.error}'),
            );
        }
        else if(snapshot.hasData){
           var extractedData = snapshot.data as List<Question>;
            return Scaffold(
       backgroundColor: background,
    appBar: AppBar(
      title: const Text("Quiz Tupas"),
      backgroundColor: background,
    ),
    body: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          QuestionWidiget(
            indexAction: index,
            question:extractedData[index].titulo , 
            totalQuestions:extractedData.length,
             ),
             const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for(int i = 0; i<extractedData[index].opcoes.length; i++ )
            optionsCard(
              option:extractedData[index].opcoes.keys.toList()[i],
              color: 
              isPressed?
             extractedData[index].opcoes.values.toList()[i] == true
                ? correct : wrong : neutral,
                onTap: changeColor,
            )
            
        ],
      ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => nextQuestion(extractedData.length),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
         child: NextButton(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
        }
      }
      else{
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return const Center(child: Text('ISso ai'),
      );
    },
   ); 
  }
}