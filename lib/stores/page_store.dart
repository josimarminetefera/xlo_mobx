import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store {
  @observable
  int pagina = 0;

  @action
  void setPagina(int valor) => pagina = valor;
}
