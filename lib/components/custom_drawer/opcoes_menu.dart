import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/custom_drawer/opcao_menu_tile.dart';
import 'package:xlo_mobx/stores/pagina_store.dart';

class OpcoesMenu extends StatelessWidget {
  final PaginaStore paginaStore = GetIt.I<PaginaStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OpcaoMenuTile(
          lable: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            paginaStore.setPagina(0);
          },
          highlighted: paginaStore.pagina == 0,
        ),
        OpcaoMenuTile(
          lable: 'Inserir Anúncios',
          iconData: Icons.edit,
          onTap: () {
            paginaStore.setPagina(1);
          },
          highlighted: paginaStore.pagina == 1,
        ),
        OpcaoMenuTile(
          lable: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            paginaStore.setPagina(2);
          },
          highlighted: paginaStore.pagina == 2,
        ),
        OpcaoMenuTile(
          lable: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            paginaStore.setPagina(3);
          },
          highlighted: paginaStore.pagina == 3,
        ),
        OpcaoMenuTile(
          lable: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {
            paginaStore.setPagina(4);
          },
          highlighted: paginaStore.pagina == 4,
        ),
        OpcaoMenuTile(
          lable: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            paginaStore.setPagina(5);
          },
          highlighted: paginaStore.pagina == 5,
        ),
      ],
    );
  }
}
