import 'package:flutter/material.dart';

class ImagemModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("imagem_modal build()");
    return BottomSheet(
      onClosing: () {},
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch, //para tudo que está dentro ocupar tudo mesmo
        children: [
          FlatButton(
            onPressed: () {},
            child: Text("Camera"),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Galeria"),
          ),
        ],
      ),
    );
  }
}
