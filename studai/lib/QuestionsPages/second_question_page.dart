import 'package:flutter/material.dart';

class second_question_page extends StatelessWidget {
  final bool isCorrect; // Indica se a resposta anterior estava correta
  final Map<String, dynamic> questionsData; // Dados da pergunta atual

  // Construtor que recebe a resposta correta e os dados da pergunta
  second_question_page({required this.isCorrect, required this.questionsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/fundoStudai.jpg'), // Imagem de fundo
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF2A2A2A).withOpacity(0.9),
              borderRadius: BorderRadius.circular(9.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    questionsData['pergunta'] ?? 'Pergunta padrão',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Sua resposta: ${isCorrect ? 'Correta' : 'Incorreta'}',
                  style: TextStyle(fontSize: 20, color: isCorrect ? Colors.green : Colors.red),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Resposta correta: ${questionsData['resposta']}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Volta para a pergunta anterior
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text(
                      'Voltar ->',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navega para a próxima pergunta, se existir
                      Navigator.pop(context); // Volta para a pergunta anterior
                      // Aqui você pode incrementar a lógica para ir para a próxima pergunta
                      // e chamar question_page novamente com o próximo índice.
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text(
                      'Próxima ->',
                      style: TextStyle(color: Colors.black),
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
