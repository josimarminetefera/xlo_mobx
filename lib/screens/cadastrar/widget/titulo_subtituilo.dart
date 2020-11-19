import 'package:flutter/material.dart';

class TituloSubtitulo extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  TituloSubtitulo({this.titulo, this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 4),
      child: Wrap(
        //para o subtitulo ficar em baixo caso não caiba.
        crossAxisAlignment: WrapCrossAlignment.end,//alinhas os textos todos em baixo
        children: [
          Text(
            '$titulo   ',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$subtitulo',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
