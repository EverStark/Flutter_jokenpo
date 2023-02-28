import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("android/imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";
  void _opcaoSelecionada(String escolhaUsuario){
      var opcoes = ["pedra","papel","tesoura"];
      var numero = Random().nextInt(3);
      var escolhaApp = opcoes[numero];

      print("Escolha do usuário: " + escolhaUsuario);
      print("Escolha do app: " + escolhaApp);

      switch(escolhaApp){
        case "pedra":
          setState(() {
            this._imagemApp = AssetImage("android/imagens/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            this._imagemApp = AssetImage("android/imagens/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            this._imagemApp = AssetImage("android/imagens/tesoura.png");
          });
          break;
      }
      if(
        (escolhaUsuario == "pedra" && escolhaApp == "papel")||(escolhaUsuario == "tesoura" && escolhaApp == "pedra")||(escolhaUsuario == "papel" && escolhaApp == "tesoura")){
        setState(() {
          this._mensagem = "Você perdeu!";
        });
      }else if(escolhaUsuario == escolhaApp){
        setState(() {
          this._mensagem = "Empate!";
        });
      }
      else{
        setState(() {
          this._mensagem = "Você venceu!";
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //linha
            //image
            //linha2
            //imagens
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text("Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Image(image:this._imagemApp),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset("android/imagens/pedra.png", height: 100,),
                ),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset("android/imagens/papel.png", height: 100,)
                ),
                GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset("android/imagens/tesoura.png", height: 100,)
                )
                //Image.asset("android/imagens/pedra.png", height: 100,),
                //Image.asset("android/imagens/papel.png",height: 100),
                //Image.asset("android/imagens/tesoura.png",height: 100),
              ],
            )
          ],
        ),
      ),
    );
  }
}
