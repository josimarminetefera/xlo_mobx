import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/screens/home/home_screen.dart';
import 'package:xlo_mobx/stores/page_store.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    //será que não seria melhor mandar isso lá para o page_section?????
    //sempre que for clicada no menu lateral vai atualizar a pagina atualizando a pagina isso aqui aciona
    reaction(
      (_) => pageStore.pagina, //fica observando esta variavel
      (pagina) => pageController.jumpToPage(pagina), //o que acontece quando altera o observable
    );
  }

  @override
  Widget build(BuildContext context) {
    //base do layout
    return Scaffold(
      //melhor forma de navegar por páginas
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(), //não move pelas laterais
        children: [
          HomeScreen(),
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.black),
          Container(color: Colors.yellow),
        ],
      ),
    );
  }
}
