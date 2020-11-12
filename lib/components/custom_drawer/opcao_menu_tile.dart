import 'package:flutter/material.dart';

class OpcaoMenuTile extends StatelessWidget {
  OpcaoMenuTile({this.lable, this.iconData, this.onTap, this.highlighted});

  final String lable;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        lable,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: highlighted ? Colors.purple : Colors.black54,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.purple : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}
