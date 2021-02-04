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
        title: Text(
          "Categoria *",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_down),
        onTap: () {
          //este aqui vai abri uma janela sobre a tela com o botão voltar
          showDialog(
            context: context,
            builder: (_) => CategoriaScreen(
              mostrar_todas_categorias: false,
              categoria_selecionada: criarAnuncioStore.categoria,
            ),
          );
        },
      );
    });
  }
}
