import 'package:mobx/mobx.dart';

part 'pagina_store.g.dart';

class PaginaStore = _PaginaStore with _$PaginaStore;

abstract class _PaginaStore with Store {

  _PaginaStore() {
    print("pagina_store _PaginaStore()");
  }

  @observable
  int pagina = 0;

  @action
  void setPagina(int valor) => pagina = valor;
}
