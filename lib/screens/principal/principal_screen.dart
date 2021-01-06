import 'package:flutter/material.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/principal/widgets/buscar_dialog.dart';

class PrincipalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("principal_screen build()");
    _abrirBuscar(String textoAtual) async {
      // o que retormar la do meu buscar eu guardo dentro da variavel texto digitado.
      final String textoDigitado = await showDialog(
        context: context,
        builder: (context) => BuscarDialog(textoAtual: textoAtual),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("XLO"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _abrirBuscar("");
              },
            )
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
