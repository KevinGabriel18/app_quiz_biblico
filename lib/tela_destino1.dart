import 'package:flutter/material.dart';
import 'tela_quiz.dart';

class TelaResultado extends StatelessWidget {
final int pontuacao;
final int totalperguntas;

TelaResultado(this.pontuacao, this.totalperguntas);

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Tela de Resultado')),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Você completou o quiz!',
style: TextStyle(fontSize: 24.0),
),
SizedBox(height: 20.0),
Text(
'Pontos: $pontuacao de $totalperguntas',
style: TextStyle(fontSize: 24.0),
),
SizedBox(height: 20.0),
ElevatedButton(
onPressed: () {
Navigator.pop(context);
Navigator.push(context,
MaterialPageRoute(builder: (context) => Quizpage()
),
);
},
child: Text('Voltar')),
],
),
));
}
}
