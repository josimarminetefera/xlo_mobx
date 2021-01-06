import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagemModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("imagem_modal build()");
    if ( Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {}, //quando fecha o modal
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch, //para tudo que está dentro ocupar tudo mesmo
          children: [
            FlatButton(
              onPressed: () {},
              child: Text("Camera"),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("Galeria"),
            ),
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: const Text("Selecionar foto para o anuncio"),
        message: const Text("Escolha a origem da foto"),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancelar",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {},
            child: Text("Camera"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: Text("Galeria"),
          ),
        ],
      );
    }
  }
}
