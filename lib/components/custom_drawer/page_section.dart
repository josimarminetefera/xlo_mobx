import 'package:flutter/material.dart';
import 'package:xlo_mobx/components/custom_drawer/page_tile.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          lable: 'Anúncios',
          iconData: Icons.list,
          onTap: () {},
          highlighted: true,
        ),
        PageTile(
          lable: 'Inserir Anúncios',
          iconData: Icons.edit,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          lable: 'Chat',
          iconData: Icons.chat,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          lable: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          lable: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {},
          highlighted: false,
        ),
        PageTile(
          lable: 'Anúncios',
          iconData: Icons.list,
          onTap: () {},
          highlighted: false,
        ),
      ],
    );
  }
}
