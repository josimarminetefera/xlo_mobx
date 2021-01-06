import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/usuario.dart';
import 'package:xlo_mobx/repositorios/usuario_repositorio.dart';

part 'usuario_gerenciador_store.g.dart';

class UsuarioGerenciadorStore = _UsuarioGerenciadorStore with _$UsuarioGerenciadorStore;

abstract class _UsuarioGerenciadorStore with Store {
  _UsuarioGerenciadorStore() {
    print("usuario_gerenciador_store _UsuarioGerenciadorStore()");
    _pegarUsuarioLogado();
  }

  @observable
  Usuario usuario;

  @action
  void setUsuario(Usuario valor) => usuario = valor;

  @computed
  bool get usuarioLogado => usuario != null;

  Future<void> _pegarUsuarioLogado() async {
    print("usuario_gerenciador_store _pegarUsuarioLogado()");
    final usuario = await UsuarioRepositorio().pegarUsuarioLogado();
    //caso tenha um usário logado eu coloco ele como logado
    //setUsuario(usuario);
    GetIt.I<UsuarioGerenciadorStore>().setUsuario(usuario);
  }
}
