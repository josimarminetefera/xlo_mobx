import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/categoria.dart';

part 'criar_anuncio_store.g.dart';

class CriarAnuncioStore = _CriarAnuncioStore with _$CriarAnuncioStore;

abstract class _CriarAnuncioStore with Store {
  _CriarAnuncioStore() {
    print("pagina_store _CriarAnuncioStore()");
  }

  ObservableList imagens = ObservableList();

  @observable
  Categoria categoria;

  //sempre setar um observer atraves de uma action 
  @action
  void setCategoria(Categoria value) => categoria = value;
}
