import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagemModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("imagem_modal build()");
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {}, //quando fecha o modal
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch, //para tudo que está dentro ocupar tudo mesmo
          children: [
            FlatButton(
              onPressed: abrirCamera,
              child: Text("Camera"),
            ),
            FlatButton(
              onPressed: abrirGaleria,
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
            onPressed: abrirCamera, //esta sem parametro () porque o onpressed não recebe parametros
            child: Text("Camera"),
          ),
          CupertinoActionSheetAction(
            onPressed: abrirGaleria,
            child: Text("Galeria"),
          ),
        ],
      );
    }
  }

  void abrirCamera() async {
    final imagePicker = await ImagePicker().getImage(source: ImageSource.camera);
    //recuperar o arquivo
    final imagem = File(imagePicker.path);
    imagemSelecionada(imagem);
  }

  void abrirGaleria() async {
    final imagePicker = await ImagePicker().getImage(source: ImageSource.gallery);
    final imagem = File(imagePicker.path);
    imagemSelecionada(imagem);
  }

  void imagemSelecionada(File imagem) {
    print(imagem.path);
  }
}
