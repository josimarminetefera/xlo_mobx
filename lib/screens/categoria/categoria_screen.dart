import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/models/categoria.dart';
import 'package:xlo_mobx/stores/categoria_store.dart';

class CategoriaScreen extends StatelessWidget {
  //contrutor para esta tela
  CategoriaScreen({this.mostrar_todas_categorias = true, this.categoria_selecionada});

  //categoria selecionada no momento
  final Categoria categoria_selecionada;
  final bool mostrar_todas_categorias;

  final CategoriaStore categoriaStore =  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Observer(builder: (_) {

          }),
        ),
      ),
    );
  }
}
