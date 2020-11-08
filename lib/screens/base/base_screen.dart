import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

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
