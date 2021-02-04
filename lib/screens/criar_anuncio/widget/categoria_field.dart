import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/categoria/categoria_screen.dart';
import 'package:xlo_mobx/stores/criar_anuncio_store.dart';

class CategoriaField extends StatelessWidget {
  CategoriaField(this.criarAnuncioStore);

  final CriarAnuncioStore criarAnuncioStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        //mudar o tamanho do texto
        title: criarAnuncioStore.categoria == null
            ? Text(
                "Categoria *",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
              )
            : Text(
                "Categoria *",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
        subtitle: criarAnuncioStore.categoria == null
            ? null
            : Text(
                "${criarAnuncioStore.categoria.descricao}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
        trailing: Icon(Icons.keyboard_arrow_down),
        onTap: () async {
          //este aqui vai abri uma janela sobre a tela com o botão voltar
          final categoria_selecionada = await showDialog(
            context: context,
            builder: (_) => CategoriaScreen(
              mostrar_todas_categorias: false,
              categoria_selecionada: criarAnuncioStore.categoria,
            ),
          );
          //se eu selecionei a categoria clicada
          if (categoria_selecionada != null) {
            criarAnuncioStore.setCategoria(categoria_selecionada);
          }
        },
      );
    });
  }
}
