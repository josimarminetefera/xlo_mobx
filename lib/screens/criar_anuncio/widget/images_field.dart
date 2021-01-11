import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/screens/criar_anuncio/widget/imagem_modal.dart';
import 'package:xlo_mobx/stores/criar_anuncio_store.dart';

class ImagesField extends StatelessWidget {
  ImagesField(this.criarAnuncioStore);

  final CriarAnuncioStore criarAnuncioStore;

  @override
  Widget build(BuildContext context) {
    print("imagem_field build()");

    //isso aqui é um callback que abre a imagem apos editar ela
    void adicionarImagemNaTela(File imagem) {
      print("imagem_field adicionarImagemNaTela()");
      criarAnuncioStore.imagens.add(imagem);
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 120, //tamanho da imagem
      child: Observer(
        builder: (context) {
          print("imagem_field -------------" + criarAnuncioStore.imagens.length.toString());
          return criarListaDeImagens(context, adicionarImagemNaTela);
        },
      ),
    );
  }

  ListView criarListaDeImagens(BuildContext context, void adicionarImagemNaTela(File imagem)) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: criarAnuncioStore.imagens.length < 5 ? criarAnuncioStore.imagens.length + 1 : 5,
      //só é permitido cadastrar até 5 imagens
      itemBuilder: (_, index) {
        if (index == criarAnuncioStore.imagens.length) {
          return novaImagemPadrao(context, adicionarImagemNaTela, index);
        } else {
          return imagemSelecionada(index);
        }
      },
    );
  }

  Padding imagemSelecionada(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: GestureDetector(
        onTap: () {},
        onDoubleTap: () {
          print("teste");
        },
        child: CircleAvatar(
          radius: 44,
          backgroundImage: FileImage(criarAnuncioStore.imagens[index]),
        ),
      ),
    );
  }

  Padding novaImagemPadrao(BuildContext context, void adicionarImagemNaTela(File imagem), int index) {
    return Padding(
      //na direita só vai ter paddin se este for o ultimo item
      padding: EdgeInsets.fromLTRB(
        8,
        16,
        index == 4 ? 8 : 0, //caso seja a ultima imagem
        16,
      ),
      child: GestureDetector(
        onTap: () {
          //a camera abre de duas formas deiferentes em cada dispositivo
          if (Platform.isAndroid) {
            showModalBottomSheet(
              context: context,
              builder: (_) => ImagemModal(adicionarImagemNaTela),
            );
          } else {
            showCupertinoModalPopup(
              context: context,
              builder: (_) => ImagemModal(adicionarImagemNaTela),
            );
          }
        },
        child: CircleAvatar(
          radius: 44,
          backgroundColor: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.photo_camera_sharp,
                size: 40,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
