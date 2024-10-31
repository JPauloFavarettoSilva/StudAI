import 'package:flutter/material.dart';
import '../Widgets/radioBtn.dart';
import 'second_question_page.dart';

class question_page extends StatefulWidget {
  final Map<String, dynamic> questionsData; // Adiciona a variável para perguntas

  // Construtor que recebe questionsData
  question_page({required this.questionsData});

  @override
  _question_pageState createState() => _question_pageState();
}

class _question_pageState extends State<question_page> {
  String? _selectedAnswer;
  bool? _isCorrect; // Variável para armazenar se a resposta está correta

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
              borderRadius: BorderRadius.circular(9.0), // Bordas arredondadas
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.8), // Cor de fundo do texto
                    borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                  ),
                  child: Text(
                    widget.questionsData['pergunta'] ?? 'Pergunta padrão', // Usa a pergunta do questionsData
                    style: TextStyle(fontSize: 18, color: Colors.white), // Texto em branco pastel
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                // Adicione suas opções de resposta aqui usando widget.questionsData
                for (int i = 1; i <= 4; i++) 
                  MyRadioListTile<String>(
                    value: widget.questionsData['alternativa$i'], // Usa a alternativa do questionsData
                    groupValue: _selectedAnswer,
                    onChanged: (value) => setState(() => _selectedAnswer = value),
                    leading: String.fromCharCode(64 + i), // Exibe a letra da opção (A, B, C, D)
                    title: Text(widget.questionsData['alternativa$i'], style: TextStyle(color: Colors.white)), // Texto em branco
                  ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity, // Largura máxima
                  child: ElevatedButton(
                    onPressed: () {
                      // Verifica se a resposta selecionada está correta
                      _isCorrect = _selectedAnswer == widget.questionsData['resposta'];
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => second_question_page(
                            isCorrect: _isCorrect!, // Passa se a resposta está correta
                            questionsData: widget.questionsData, // Passa questionsData para a próxima página
                          ),
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
                      'Próxima ->',
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
