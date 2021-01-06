import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/login/login_screen.dart';
import 'package:xlo_mobx/stores/pagina_store.dart';
import 'package:xlo_mobx/stores/usuario_gerenciador_store.dart';

class CabecalhoDrawer extends StatelessWidget {
  final UsuarioGerenciadorStore usuarioGerenciadorStore = GetIt.I<UsuarioGerenciadorStore>();

  @override
  Widget build(BuildContext context) {
    print("cabecalho_drawer build()");
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (usuarioGerenciadorStore.usuarioLogado) {
          //de qualquer parte do app consigo ir para pagestore
          GetIt.I<PaginaStore>().setPagina(4);
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        }
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            const SizedBox(
              width: 20,
            ),
            _conteudoCabecalho(),
          ],
        ),
      ),
    );
  }

  Expanded _conteudoCabecalho() {
    print("cabecalho_drawer _conteudoCabecalho()");
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            usuarioGerenciadorStore.usuarioLogado ? usuarioGerenciadorStore.usuario.nome : "Acesse sua conta agora!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            usuarioGerenciadorStore.usuarioLogado ? usuarioGerenciadorStore.usuario.email : "Clique Aqui",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
