import 'package:http/http.dart' as http;
import './questions_module.dart';
import 'dart:convert';

class DbFirebase {
  final url = Uri.parse('https://quiztupas-default-rtdb.firebaseio.com/questions.json');

  Future<void> addQuestion(Question question) async{
    http.post(url, 
    body: json.encode({
     'titulo': question.titulo,
     'opcoes': question.opcoes,
    }));
  }

  Future<List<Question>> pegarQuestao() async{
   return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List <Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key, 
          titulo: value['titulo'],
           opcoes: Map.castFrom(value['opcoes']),
            );
            newQuestions.add(newQuestion);
      });
      return newQuestions;
     });
  }
}