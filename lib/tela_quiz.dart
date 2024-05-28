import 'package:flutter/material.dart';
import 'tela_destino1.dart';





class Quizpage extends StatefulWidget {
@override
_QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
int questionIndex = 0;
int score = 0;

List<Question> questions = [
Question(
    'A Bíblia quantos livros?',
    '66',
    'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
    ['66', '45', '64'],
  ),
  Question(
    'Quantos evangelhos existem no Novo Testamento?',
    '4',
    'https://t4.ftcdn.net/jpg/05/29/98/25/360_F_529982581_VkEiHVfd8kNM0H73cUw9VwDWyyP9BSxf.png',
    ['3', '4', '5'],
  ),
  Question(
    'Quem foi lançado na cova dos leões?',
    'Daniel',
    'https://static.vecteezy.com/system/resources/previews/027/765/346/non_2x/quiz-sign-mark-free-free-png.png',
    ['Daniel', 'Elias', 'Jonas'],
  ),
  Question(
    'Quem construiu a arca?',
    'Noé',
    'https:https://png.pngtree.com/png-clipart/20231005/original/pngtree-quiz-questions-answers-vector-png-image_13279607.png',
    ['Noé', 'Moisés', 'Abraão'],
  ),
  Question(
    'Quem foi o primeiro rei de Israel?',
    'Saul',
    'https://www.pngitem.com/pimgs/m/79-795013_quiz-icon-png-transparent-png.png',
    ['Saul', 'Davi', 'Salomão'],
  ),
  Question(
    'Qual é o menor versículo da Bíblia?',
    'Jesus chorou.',
    'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
    ['Jesus chorou.', 'No princípio, Deus criou os céus e a terra.', 'E disse Deus: Haja luz.'],
  ),
  Question(
    'Quem foi engolido por um grande peixe?',
    'Jonas',
    'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
    ['Jonas', 'Pedro', 'Paulo'],
  ),
  Question(
    'Quem recebeu as tábuas dos Dez Mandamentos?',
    'Moisés',
    'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
    ['Moisés', 'Abraão', 'Isaac'],
  ),
  Question(
    'Qual livro da Bíblia vem depois de João?',
    'Atos',
    'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
    ['Atos', 'Romanos', 'Gálatas'],
  ),
  Question(
    'Quem foi o homem mais forte da Bíblia?',
    'Sansão',
    'https://png.pngtree.com/png-clipart/20230811/original/pngtree-comic-speech-bubbles-with-text-quiz-picture-image_7868432.png',
    ['Sansão', 'Davi', 'Golias'],
  ),

];

void checkAnswer(String userAnswer) {
String correctAnswer = questions[questionIndex].answer;

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
     questions[questionIndex].imageUrl,
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
children: questions[questionIndex].options.map((option) {
return ElevatedButton(
onPressed: () => checkAnswer(option),
child: Text(option),
);
}).toList(),
),



Container(
padding: EdgeInsets.symmetric(vertical: 16.0),
child: Text(
'Pontuação: $score / ${questions.length}',
textAlign: TextAlign.center,
style: TextStyle(fontSize: 20.0),
),
), ElevatedButton(
child: Text('resetar'),
onPressed: () =>resetquiz(),
),
],
),
);
}
}

class Question {
final String questionText;
final String answer;
final String imageUrl;
final List<String> options;

Question(this.questionText, this.answer, this.imageUrl, this.options);
}
