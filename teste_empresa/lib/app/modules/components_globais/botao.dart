import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final Function onPressed;
  final String titulo;
  final Color cor;
  const Botao({Key key, this.onPressed, this.titulo, this.cor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: FloatingActionButton.extended(
          heroTag: null,
          backgroundColor: cor,
          label: Text('$titulo'),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
