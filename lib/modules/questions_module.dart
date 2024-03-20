
class Question{
  final String id;
  final String titulo;
  final Map<String, bool> opcoes;

  Question({
    required this.id,
    required this.titulo,
    required this.opcoes,
  });
   
   @override
   String toString(){
    return 'Question(id: $id,title: $titulo ,options:  $opcoes )';
   }

}