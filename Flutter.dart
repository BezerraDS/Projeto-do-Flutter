import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

// StatelessWidget não muda estado
// StatefulWidget muda o estado
class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
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

    setState(() {
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

  
  Widget build(BuildContext context) {
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
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('data:image/jpeg;base64,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', width: 100, height: 100),
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
              }).toList(),
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
