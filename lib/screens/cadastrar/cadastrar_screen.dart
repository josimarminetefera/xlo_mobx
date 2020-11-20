import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/cadastrar/widget/titulo_subtituilo.dart';
import 'package:xlo_mobx/stores/cadastrar_store.dart';

class CadastrarScreen extends StatelessWidget {
  final CadastrarStore cadastrarStore = CadastrarStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          //para dar scrool no card
          child: Padding(
            padding: EdgeInsets.only(bottom: 16), //Para não cortar a sombra do card por causa do SigleChildScoolView
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, //maio largura possivel
                  mainAxisSize: MainAxisSize.min, //altura minima
                  children: [
                    _formularioCadastro(),
                    _botaoCadastrar(),
                    Divider(
                      color: Colors.black,
                    ),
                    _botaoEntrar(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _formularioCadastro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TituloSubtitulo(
          titulo: "Apelido",
          subtitulo: "Como aparecerá em seus anúncios.",
        ),
        Observer(builder: (_) {
          return TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "Nome",
              isDense: true,
              errorText: cadastrarStore.nomeErro,
            ),
            onChanged: cadastrarStore.setNome,
          );
        }),
        SizedBox(
          height: 16,
        ),
        TituloSubtitulo(
          titulo: "E-mail",
          subtitulo: "Enviaremos um e-mail de confirmação.",
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "nome@servidor.com",
            isDense: true,
          ),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false, //desabilita correcao
        ),
        SizedBox(
          height: 16,
        ),
        TituloSubtitulo(
          titulo: "Celular",
          subtitulo: "Proteja sua conta.",
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "(99) 99999-9999",
            isDense: true,
          ),
          keyboardType: TextInputType.phone,
          autocorrect: false,
          inputFormatters: [
            WhitelistingTextInputFormatter.digitsOnly, //só aceita passar
            TelefoneInputFormatter(), //mascara de telefone
          ],
        ),
        SizedBox(
          height: 16,
        ),
        TituloSubtitulo(
          titulo: "Senha",
          subtitulo: "Use letras, números e caracteres especiais.",
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 16,
        ),
        TituloSubtitulo(
          titulo: "Confirmar Senha",
          subtitulo: "Repita a senha.",
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

  Container _botaoCadastrar() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 20, bottom: 12),
      child: RaisedButton(
        color: Colors.orange,
        child: Text("Cadastrar"),
        textColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: () {},
      ),
    );
  }

  Padding _botaoEntrar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Já tem uma conta? ',
            style: TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Entrar',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.purple,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
