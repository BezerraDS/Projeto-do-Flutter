import 'package:flutter/material.dart';

void main() {
  runApp(myApp()); // Inicia o código
}

// StatelessWidget não muda estado
// StatefulWidget muda o estado
class myApp extends StatefulWidget { //criação da classe app
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> { // herança 
  final List<Map<String, dynamic>> perguntas = [
    
    {
      'pergunta': 'Qual país tem o maior número de vulcões ativos?',
      'opcoes': ['Japão','Indonésia','Estados Unidos','Islândia'],
      'respostaCorreta': 'Indonésia',
    },
    {
      'pergunta': 'Quantos idiomas existem no mundo?',
      'opcoes': ['Cerca de 1.500','Cerca de 3.000','Cerca de 6.000','Cerca de 10.000'],
      'respostaCorreta': 'Cerca de 6.000',
    },
    {
      'pergunta': 'Qual é o único continente onde os pingüins não são encontrados?',
      'opcoes': ['Europa','Ásia','África','América do Norte'],
      'respostaCorreta': 'África',
    },
    {
      'pergunta': 'Qual é o país que tem mais ilhas no mundo?',
      'opcoes': ['Japão','Suécia','Grécia','Indonésia'],
      'respostaCorreta': 'Suécia',
    },
    {
      'pergunta': 'Qual é o ponto mais baixo da Terra?',
      'opcoes': ['Mar Morto','Grande Barreira de Coral','Vale da Morte','Lago Assal'],
      'respostaCorreta': 'Mar Morto',
    },
  ];
  //inicializa os valores do quiz
  int perguntaAtual = 0;
  int pontos = 0;
  Text? mensagem;
  bool quizFinalizado = false;

  //função que verifica a resposta
  void verificarResposta(String respostaEscolhida) {
    String respostaCorreta = perguntas[perguntaAtual]['respostaCorreta'];

    setState(() { //Verificação de respostas
      if (respostaEscolhida == respostaCorreta) {
        pontos++;
        mensagem = Text('NA LATA +1 PONTO',style: TextStyle(
                color: Colors.black,
                fontSize: 15,        // <-- para ajustar o tamanho da fonte
                fontWeight: FontWeight.bold // <-- para deixar a letra mais destacada        
          ),             
        );
      } else {
        mensagem = Text('ERROOOOOU!',style: TextStyle(
                color: Colors.black,
                fontSize: 15,        // <-- para ajustar o tamanho da fonte
                fontWeight: FontWeight.bold // <-- para deixar a letra mais destacada
                ),             
                       
        );
      }
    });
    //espera 2 segundos e passa para a próxima pergunta

   Future.delayed(Duration(seconds: 2), () {
    setState(() {
      mensagem = null;
      if(perguntaAtual < perguntas.length - 1){
        perguntaAtual++;
      } else {
        quizFinalizado = true;
      }
    });
  });
  }//fim do método anteior

  

  // método para reiniciar o quiz
  void reiniciarQuiz(){
    setState(() {
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
    });
  }

  
  Widget build(BuildContext context) { //criação do visual do app
    return MaterialApp(
      theme:ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        
        backgroundColor: Colors.cyan,
        appBar:( AppBar(title: Text('Curiosidades do mundo',style: TextStyle(color:                          Colors.black,fontSize: 25, // <-- para ajustar o tamanho da fonte
                fontWeight: FontWeight.bold // <-- para deixar a letra mais destacada
                ),
                ),backgroundColor: Colors.cyan)),//<--- background do app bar
        body: Center(
          child: quizFinalizado ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Parabéns! Você terminou o quiz!',
                textAlign: TextAlign.center,
                style: TextStyle(color:Colors.black,fontSize:                                       25,fontWeight:FontWeight.bold)
              ),
              SizedBox(height: 20),
              Text(
                'Sua pontuação: $pontos/${perguntas.length}',
                style: TextStyle(
                color: Colors.black,
                fontSize: 15,        // <-- para ajustar o tamanho da fonte
                fontWeight: FontWeight.bold // <-- para deixar a letra mais destacada
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: reiniciarQuiz,
                child: Text('Recomeçar',style: TextStyle(
                color: Colors.white,
                fontSize: 15,        // <-- para ajustar o tamanho da fonte
                fontWeight: FontWeight.bold // <-- para deixar a letra mais destacada
                ),)
              )
            ],
          ) : Column(// todo visual em coluna
            mainAxisAlignment: MainAxisAlignment.center,
            children: [//filho
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ1MjNByCtg3us8jrrTgPjDPt-aRSIoNVP_g&s', width: 100, height: 100),
              SizedBox(height: 20),
              Text(
                perguntas[perguntaAtual]['pergunta'],
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.black,
                fontSize: 15,        // <-- para ajustar o tamanho da fonte
                fontWeight: FontWeight.bold // <-- para deixar a letra mais destacada
                ),
                
              
              ),
              SizedBox(height: 20),
              ...perguntas[perguntaAtual]['opcoes'].map<Widget>((opcao) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ElevatedButton(
                    onPressed: mensagem == null ? () => verificarResposta(opcao) : null,
                    child: Text(opcao)
                  )
                );
              }).toList(),//lista
              SizedBox(height: 20),
              if (mensagem != null)
                (mensagem!),
              SizedBox(height: 20),
              Text('Pontuação: $pontos', style: TextStyle(
                color: Colors.black,
                fontSize: 15,        // <-- para ajustar o tamanho da fonte
                fontWeight: FontWeight.bold // <-- para deixar a letra mais destacada
                ),)
            ],
          )
        ),
      )
    );
  }    
}
