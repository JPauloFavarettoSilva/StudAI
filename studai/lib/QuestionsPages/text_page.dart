import 'package:flutter/material.dart';
import 'question_page.dart';

class text_page extends StatelessWidget {
  final Map<String, dynamic> questionsData;

  // Construtor que recebe o parâmetro questionsData
  text_page({required this.questionsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/fundoStudai.jpg'), // Imagem de fundo
            fit: BoxFit.cover, // Ajusta a imagem de fundo
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF2A2A2A).withOpacity(0.9), // Cor preto levemente cinza
              borderRadius: BorderRadius.circular(8.0), // Bordas arredondadas
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      questionsData['texto'] ?? 'Texto explicativo sobre Introdução à Lógica de Programação...', // Usa o 'texto' de questionsData
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Letras em branco pastel
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Espaço entre o texto e o botão
                SizedBox(
                  width: double.infinity, // Largura máxima
                  child: ElevatedButton(
                    onPressed: () {
                      // Passando questionsData para question_page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => question_page(questionsData: questionsData), // Passa as perguntas
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Bordas retas
                      ),
                    ),
                    child: Text(
                      'Praticar',
                      style: TextStyle(color: Colors.black), // Texto em preto forte
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
