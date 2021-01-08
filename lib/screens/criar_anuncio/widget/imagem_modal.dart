import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagemModal extends StatelessWidget {
  ImagemModal(this.adicionarImagemNaTela);

  //esta função aqui é executada la no image_modal
  final Function(File) adicionarImagemNaTela;

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
    print("imagem_modal abrirCamera()");
    final imagePicker = await ImagePicker().getImage(source: ImageSource.camera);
    if (imagePicker == null) return;
    //recuperar o arquivo
    final imagem = File(imagePicker.path);
    imagemSelecionada(imagem);
  }

  void abrirGaleria() async {
    print("imagem_modal abrirGaleria()");
    final imagePicker = await ImagePicker().getImage(source: ImageSource.gallery);
    if (imagePicker == null) return;
    //recuperar o arquivo
    final imagem = File(imagePicker.path);
    imagemSelecionada(imagem);
  }

  Future<void> imagemSelecionada(File imagem) async {
    print("imagem_modal imagemSelecionada()");
    print(imagem.path);
    final imagemCortada = await ImageCropper.cropImage(
      sourcePath: imagem.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "Editar Imagem",
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
        title: "Editar Imagem",
        cancelButtonTitle: "Cancelar",
        doneButtonTitle: "Concluir",
      ),
    );
    if (imagemCortada != null) {
      adicionarImagemNaTela(imagemCortada);
    }
  }
}
