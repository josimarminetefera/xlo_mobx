import 'package:flutter/material.dart';

class ErroBox extends StatelessWidget {
  ErroBox({this.mensagem});

  final String mensagem;

  @override
  Widget build(BuildContext context) {
    if (mensagem == null) {
      return Container();
    } else {
      return Container(
        color: Colors.red,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                'Oops! $mensagem. Por favor, tente novamente.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
