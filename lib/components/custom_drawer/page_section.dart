import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/custom_drawer/page_tile.dart';
import 'package:xlo_mobx/stores/page_store.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          lable: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            pageStore.setPagina(0);
          },
          highlighted: pageStore.pagina == 0,
        ),
        PageTile(
          lable: 'Inserir Anúncios',
          iconData: Icons.edit,
          onTap: () {
            pageStore.setPagina(1);
          },
          highlighted: pageStore.pagina == 1,
        ),
        PageTile(
          lable: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            pageStore.setPagina(2);
          },
          highlighted: pageStore.pagina == 2,
        ),
        PageTile(
          lable: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            pageStore.setPagina(3);
          },
          highlighted: pageStore.pagina == 3,
        ),
        PageTile(
          lable: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {
            pageStore.setPagina(4);
          },
          highlighted: pageStore.pagina == 4,
        ),
        PageTile(
          lable: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            pageStore.setPagina(5);
          },
          highlighted: pageStore.pagina == 5,
        ),
      ],
    );
  }
}
