import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final Widget? trailing;
  final dynamic tela;

  const Item(
      {super.key,
      required this.titulo,
      required this.icone,
      required this.trailing,
      required this.tela});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icone),
      title: Text(titulo),
      trailing: trailing,
      onTap: tela == null
          ? null
          : () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => tela));
            },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
  }
}
