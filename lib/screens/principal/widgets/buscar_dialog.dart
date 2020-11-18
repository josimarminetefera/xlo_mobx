import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuscarDialog extends StatefulWidget {
  final String textoAtual;

  BuscarDialog({this.textoAtual});

  @override
  _BuscarDialogState createState() => _BuscarDialogState(textoAtual);
}

class _BuscarDialogState extends State<BuscarDialog> {
  //outra forma de mandar a varavel para o State
  // quando eu uso os : ele vai iniciar o valor junto com o construtor
  _BuscarDialogState(String textoAtual) : _pesquisarController = TextEditingController(text: textoAtual);

  final TextEditingController _pesquisarController;

  @override
  Widget build(BuildContext context) {
    //caixa que adicionado sobre as outras com tamanho específico
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Column(
            children: [
              Card(
                child: TextField(
                  controller: _pesquisarController,
                  textInputAction: TextInputAction.search,
                  //este parametro mostra a lupa la no teclado do google
                  autofocus: true,
                  //ja foca na barra de buscar
                  decoration: InputDecoration(
                    //todos campos ficaram dentro do decoration
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.green[700],
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.green[700],
                      onPressed: () {
                        _pesquisarController.clear();
                      },
                    ),
                  ),
                  onSubmitted: (texto) {
                    //para passar o texto que eu digito nesta caixa de texto
                    Navigator.of(context).pop(texto);
                  },
                ),
              ),
              Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        color: Colors.red,
                        child: Text("1"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        color: Colors.blue,
                        child: Text("2"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        color: Colors.red,
                        child: Text("1ffs fdsa hjfdsafds"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        color: Colors.blue,
                        child: Text("2"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
