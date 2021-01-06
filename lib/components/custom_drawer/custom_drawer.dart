import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/components/custom_drawer/opcoes_menu.dart';

import 'cabecalho_drawer.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("custom_drawer build()");
    //ClipRRect usado para cortar qualquer widget
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          child: ListView(
            children: [
              CabecalhoDrawer(),
              OpcoesMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
