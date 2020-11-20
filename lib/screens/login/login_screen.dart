import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/cadastrar/cadastrar_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center, //alinhas o card no centro do containner
        child: SingleChildScrollView(
          // para dar scrool em um widget
          child: Padding(
            padding: EdgeInsets.only(bottom: 16), //para não cortar a sombra por conta do SigleChildScrool
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                //afasta tudo mundo de dentro
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, //largura maxima
                  mainAxisSize: MainAxisSize.min, //altura minima
                  children: [
                    _tituloAcessarComEmail(),
                    _camposEmailSenha(),
                    _botaoEntrar(),
                    Divider(
                      color: Colors.black,
                    ),
                    _textoCadastrar(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text _tituloAcessarComEmail() {
    return Text(
      "Acessar com E-mail:",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[900],
      ),
    );
  }

  Column _camposEmailSenha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
          child: Text(
            "E-mail",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(), //borda emvolta do botão
            isDense: true,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.only(left: 3, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // espaçamento entre dois campos
            children: [
              Text(
                "Senha",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                child: Text(
                  "Esqueceu sua senha?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.purple,
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          obscureText: true,
        ),
      ],
    );
  }

  Container _botaoEntrar() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 20, bottom: 12),
      child: RaisedButton(
        color: Colors.orange,
        child: Text("Entrar"),
        textColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: () {},
      ),
    );
  }

  Padding _textoCadastrar(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Wrap(
        //serve para quebrar para a linha de baixo caso nao caiba o campo
        alignment: WrapAlignment.center,
        children: [
          Text(
            "Não tem uma conta?",
            style: TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CadastrarScreen(),
                ),
              );
            },
            child: Text(
              "Cadastre-se",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.purple,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
