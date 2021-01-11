import 'package:flutter/material.dart';

class MostrarImagemNaTela extends StatelessWidget {
  MostrarImagemNaTela({@required this.imagem, @required this.onDelete});

  final dynamic imagem;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,//tamanho minimo da coluna
        children: [
          Image.file(imagem),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
            child: const Text("Excluir"),
          )
        ],
      ),
    );
  }
}
