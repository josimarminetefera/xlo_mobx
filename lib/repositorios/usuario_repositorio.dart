import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/repositorios/chave_repositorio.dart';

import '../models/usuario.dart';

class UsuarioRepositorio {
  Future<void> cadastrar(Usuario usuario) async {
    final parseUser = ParseUser(
      usuario.email,
      usuario.senha,
      usuario.email,
    );

    parseUser.set<String>(USUARIONOME, usuario.nome);
    parseUser.set<String>(USUARIOTELEFONE, usuario.telefone);
    parseUser.set(USUARIOTIPO, usuario.tipo.index);

    //criar um usuário no parse server
    await parseUser.signUp();
  }
}
