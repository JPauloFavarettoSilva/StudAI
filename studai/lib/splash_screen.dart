import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0; // Faz o texto, logo e fundo se tornarem invisíveis
      });
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/fundoStudai.jpg'),
            fit: BoxFit.fitHeight, // Ajuste a imagem para caber melhor
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2), // Tempo da transição da opacidade
                child: Image.asset(
                  'Assets/StudaAiLogo.png',
                  height: 150, // Ajuste a altura conforme necessário
                  width: 150, // Ajuste a largura conforme necessário
                ),
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2), // Tempo da transição da opacidade
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'S',
                        style: TextStyle(color: Colors.red, fontSize: 30, fontFamily: 'YourCustomFont'),
                      ),
                      TextSpan(
                        text: 't',
                        style: TextStyle(color: Colors.orange, fontSize: 30, fontFamily: 'YourCustomFont'),
                      ),
                      TextSpan(
                        text: 'u',
                        style: TextStyle(color: Colors.green, fontSize: 30, fontFamily: 'YourCustomFont'),
                      ),
                      TextSpan(
                        text: 'd',
                        style: TextStyle(color: Colors.teal, fontSize: 30, fontFamily: 'YourCustomFont'),
                      ),
                      TextSpan(
                        text: 'A',
                        style: TextStyle(color: Colors.blue, fontSize: 30, fontFamily: 'YourCustomFont'),
                      ),
                      TextSpan(
                        text: 'I',
                        style: TextStyle(color: Colors.purple, fontSize: 30, fontFamily: 'YourCustomFont'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
