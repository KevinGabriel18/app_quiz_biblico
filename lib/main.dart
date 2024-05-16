import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_inicial.dart';
import 'tela_destino1.dart';
void main() {
runApp(Quizapp());
}

class Quizapp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
theme: ThemeData(
primarySwatch: Colors.grey,
),
home: TelaInicial(),
);
}
}

class Quizpage extends StatefulWidget {
@override
_QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
int questionIndex = 0;
int score = 0;

List<Question> questions = [
Question('A Biblia tem 66 livros?', true),
Question('Moises abriu o mar vermelho?', true),
Question('A salvação é pela graça?', true),
Question('Deus é mal?', false),
Question('Deus criou tudo?', true),
Question('Saul matou golias?', false),
Question('Deus tem planos de paz', true),
Question('A palavra de Deus se renova a cada dia?', false),

];

void checkAnswer(bool userAnswer) {
bool correctAnswer = questions[questionIndex].answer;

setState(() {
if (userAnswer == correctAnswer) {
score++;
}
if (questionIndex < questions.length - 1) {
questionIndex++;
}else {
Navigator.push(context,
MaterialPageRoute(builder: (context) => TelaResultado(score, questions.length,)),

);
}
}
);
}

void resetquiz() {
setState(() {
questionIndex = 0;
score = 0;
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Quiz',style: TextStyle(fontSize: 25.0),),
centerTitle: true,
),
body: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
Expanded(
flex: 3,
child: Image.network(
     'https://t3.ftcdn.net/jpg/05/69/96/48/360_F_569964847_Wa3tNpPYRGABpplPGSFT3LLB7E2wU0jb.jpg',
fit: BoxFit.contain,
),
),
Expanded(
flex: 7,
child: Center(
child: Text(
questions[questionIndex].questionText,
textAlign: TextAlign.center,
style: TextStyle(fontSize: 24.0,),
),
),
),

Wrap(
alignment: WrapAlignment.center,
spacing: 8.0,
runSpacing: 8.0,
children: [
ElevatedButton(
onPressed: () => checkAnswer(true),
child: Text('Sim'),
),
ElevatedButton(
onPressed: () => checkAnswer(false),
child: Text('Não'),
),
],
),
Padding(
padding: EdgeInsets.symmetric(vertical: 16.0),
child: Text(
'Pontuação: $score / ${questions.length}',
textAlign: TextAlign.center,
style: TextStyle(fontSize: 20.0),
),
),
ElevatedButton(
child: Text('resetar'),
onPressed: () =>resetquiz(),
)
],
));
}
}

class Question {
final String questionText;
final bool answer;

Question(this.questionText, this.answer);
}
