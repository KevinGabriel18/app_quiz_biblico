import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://t3.ftcdn.net/jpg/05/69/96/48/360_F_569964847_Wa3tNpPYRGABpplPGSFT3LLB7E2wU0jb.jpg',
              width: 200, 
              height: 200, 
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quizpage()),
                );
              },
              child: Text('Começar o Quiz'), 
            ),
          ],
        ),
      ),
    );
  }
}