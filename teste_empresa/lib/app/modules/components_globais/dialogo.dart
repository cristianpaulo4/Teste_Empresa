import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/modules/components_globais/botao.dart';
import 'package:teste_empresa/app/modules/components_globais/input.dart';
import 'package:teste_empresa/app/modules/utls/utls.dart';

class TrocarHash extends StatefulWidget {
  @override
  _TrocarHashState createState() => _TrocarHashState();
}

class _TrocarHashState extends State<TrocarHash> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController _texto = TextEditingController();

    return Dialog(
      child: Form(
        key: _key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Input(
              controller: _texto,
              label: 'Digite o Hash',
              erro: 'Digite o hash',
            ),
            Botao(
              titulo: 'Trocar',
              onPressed: () {
                if (_key.currentState.validate()) {
                  print(_texto.text);
                  Modular.to.pop();
                  apiHash = _texto.text;
                  setState(() {});
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
