import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> animacoes = ["Stand", "Dance", "Jump", "Wave"];
  String animacaoAtual = "";

  @override
  Widget build(BuildContext context) {
    //animacaoAtual = animacoes[0];
    List<Widget> botoes = [
      _botao(context, 0),
      _botao(context, 1),
      _botao(context, 2),
      _botao(context, 3)
    ];

    return Scaffold(
      //  backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("App animação"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: FlareActor("assets/Minion.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animacaoAtual),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: botoes.toList(),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: FlareActor("assets/WorldSpin.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: "roll"),
            ),
            RaisedButton(
                child: Text("Dialog"),
                onPressed: () {
                  _dialogCarregamento(context);
                  Future.delayed(Duration(seconds: 2)).then((onValue) {
                    Navigator.of(context).pop();
                  });
                })
          ],
        ),
      ),
    );
  }

  _dialogCarregamento(context) {
    showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: FlareActor("assets/WorldSpin.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: "roll"),
                  ),
                  Text("Carregando..."),
                ],
              ),
            ),
          );
        });
  }

  Widget _botao(context, int posicao) {
    return RaisedButton(
      child: Text(animacoes[posicao]),
      onPressed: () {
        setState(() {
          animacaoAtual = animacoes[posicao];
          print(animacaoAtual);
        });
      },
    );
  }

//
}
