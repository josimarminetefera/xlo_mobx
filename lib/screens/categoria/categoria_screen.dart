import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/erro_box.dart';
import 'package:xlo_mobx/models/categoria.dart';
import 'package:xlo_mobx/stores/categoria_store.dart';

class CategoriaScreen extends StatelessWidget {
  //contrutor para esta tela
  CategoriaScreen({this.mostrar_todas_categorias = true, this.categoria_selecionada});

  //categoria selecionada no momento
  final Categoria categoria_selecionada;
  final bool mostrar_todas_categorias;

  //consigo acessar ainstanccia que está la no main
  final CategoriaStore categoriaStore = GetIt.I<CategoriaStore>();

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
            //3 possibilidades ou erro ou carregando ou os dados
            //aquitem que ter acesso a categoriaStore
            if (categoriaStore.erro != null) {
              return ErroBox(
                mensagem: categoriaStore.erro,
              );
            } else if (categoriaStore.listaCategorias.isEmpty) {
              //ainda não troxe a lista de categorias
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              //já está com todos dados
              final categorias = mostrar_todas_categorias ? categoriaStore.listaCategoriasCompleta : categoriaStore.listaCategorias;
              //separated é para criar uma lista separada
              return ListView.separated(
                itemCount: categorias.length,
                separatorBuilder: (_, __) {
                  return Divider(
                    height: 0.1,
                    color: Colors.grey,
                  );
                },
                itemBuilder: (_, index) {
                  final categoria = categorias[index];
                  //InkWell serve para tocar em algo
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(categoria);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      //pinta de rocho caso seja selecionado
                      color: (categoria.id == categoria_selecionada?.id) ? Colors.purple.withAlpha(50) : null,
                      child: Text(
                        categoria.descricao,
                        style: TextStyle(
                          color: Colors.grey[700],
                          //coloca em negrito caso esteja selecionado
                          fontWeight: (categoria.id == categoria_selecionada?.id) ? FontWeight.bold : null,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
