import 'package:flutter/material.dart';

class conclusion_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Resumo das respostas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            // Exemplo de resumo das respostas (simulação)
            Text('Pergunta 1: Python (Correta)', style: TextStyle(color: Colors.green)),
            Text('Pergunta 2: Sequência (Errada, Correta: Repetição)', style: TextStyle(color: Colors.red)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navega para uma página de revisão
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Revisar'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Volta para o início
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Terminar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
