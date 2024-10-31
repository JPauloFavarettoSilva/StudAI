import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'QuestionsPages/text_page.dart';

class HomePage extends StatelessWidget {
  Future<Map<String, dynamic>> fetchQuestions(String topic) async {
    final response = await http.get(
      Uri.parse('https://localhost:7125/api/question?question=$topic'),
      headers: {'accept': '*/*'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load questions');
    }
  }

  void navigateToTextPage(BuildContext context, String topic) async {
    try {
      var data = await fetchQuestions(topic);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => text_page(
            questionsData: data,
          ),
        ),
      );
    } catch (e) {
      print("Error loading questions: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O que iremos estudar hoje?'),
        centerTitle: true,
        backgroundColor: Colors.white, // Cor branca pastel sem opacidade
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/fundoStudai.jpg'),
            fit: BoxFit.cover, // Ajusta a imagem de fundo
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity, // Largura máxima
                child: ElevatedButton(
                  onPressed: () {
                    navigateToTextPage(context, 'IntProg'); // Parâmetro para o botão 1
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor vibrante
                    foregroundColor: Colors.black, // Cor do texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text('Introdução à Lógica de Programação'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Largura máxima
                child: ElevatedButton(
                  onPressed: () {
                    navigateToTextPage(context, 'SOeRC'); // Parâmetro para o botão 2
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Cor vibrante
                    foregroundColor: Colors.black, // Cor do texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text('Sistemas Operacionais e Redes de Computadores'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Largura máxima
                child: ElevatedButton(
                  onPressed: () {
                    navigateToTextPage(context, 'HtmleBD'); // Parâmetro para o botão 3
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Cor vibrante
                    foregroundColor: Colors.black, // Cor do texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text('Introdução ao Desenvolvimento Web e Banco de Dados'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Largura máxima
                child: ElevatedButton(
                  onPressed: () {
                    navigateToTextPage(context, 'AlgeLogProg'); // Parâmetro para o botão 4
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Cor vibrante
                    foregroundColor: Colors.black, // Cor do texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text('Algoritmos e Lógica de Programação'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}