import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatefulWidget{
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp>{
  final List<Map<String, dynamic>> perguntas = [
    { 
      "pergunta": "Qual é a capital do Brasil?",
      "opcoes": ["São Paulo", "Brasília", "Rio de Janeiro"],
      "respostaCorreta": "Brasília",
    },
  ];
  //Inicializa os valores do Quiz
  int perguntaAtual = 0;
  int pontos = 0;
  String? mensagem;
  bool quizFinalizado = false;
  
  //função que verifica a resposta
  void verificarResposta(String respostaEscolhida){
    String respostaCorreta = perguntas[perguntaAtual]["respostaCorreta"];
    
    setState((){
      if (respostaEscolhida == respostaCorreta){
        pontos++;
        mensagem = "Resposta certa! +1";
      } else{
        mensagem = "Resposta errada!";
      }
      
    });
  }
  
  //faz delay
  Future.delayed(Duration(seconds:2),(){
    SetState((){
      mensagem = null;
      if(perguntaAtual < perguntas.lenght - 1){
        perguntaAtual++
      } else{
        quizFinalizado = true;
      }  
   
    });
      
  });
  //método para reiniciar Quiz
   void reiniciarQuiz(){
     setState((){
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
             
    });
   }
  
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme:ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Meu app")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(height:20),
              Text(texto, style:TextStyle(fontSize: 30,color: Colors.red)),
              SizedBox(height:20),
              ElevatedButton(onPressed: alterarTexto,child: Text("Aperte-me")),
            ],
          ),
        
        ),
      ),
    
    );
    
  }
  
  
  
  
}