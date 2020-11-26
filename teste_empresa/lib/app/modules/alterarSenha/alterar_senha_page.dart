import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/modules/components_globais/botao.dart';
import 'package:teste_empresa/app/modules/components_globais/dialogo.dart';
import 'package:teste_empresa/app/modules/components_globais/input.dart';
import 'alterar_senha_controller.dart';
import 'package:crypto/crypto.dart' as crypto;

class AlterarSenhaPage extends StatefulWidget {
  final String title;
  const AlterarSenhaPage({Key key, this.title = "Alterar Senha"})
      : super(key: key);

  @override
  _AlterarSenhaPageState createState() => _AlterarSenhaPageState();
}

class _AlterarSenhaPageState
    extends ModularState<AlterarSenhaPage, AlterarSenhaController> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _senha2 = TextEditingController();
  bool visivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        elevation: 0,
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: visivel,
              child: LinearProgressIndicator(backgroundColor: Colors.white),
            ),
            SizedBox(
              height: 80,
            ),
            Dialog(
              child: Form(
                key: _globalKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                      controller: _email,
                      label: 'Email',
                      erro: 'Digite o email',
                      type: TextInputType.emailAddress,
                    ),
                    Input(
                      controller: _senha,
                      label: 'Digite a senha',
                      erro: 'Digite a senha',
                    ),
                    Input(
                      controller: _senha2,
                      label: 'Digite a Nova Senha',
                      erro: 'Digite a senha',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Botao(
                      titulo: 'Alterar senha',
                      onPressed: () async {
                        if (_globalKey.currentState.validate()) {
                          String senhaAntiga = crypto.md5
                              .convert(utf8.encode(_senha.text))
                              .toString();
                          String novaSenha = crypto.md5
                              .convert(utf8.encode(_senha2.text))
                              .toString();

                          setState(() {
                            visivel = true;
                          });
                          if (await controller.alterarSenha(
                              _email.text, senhaAntiga, novaSenha)) {
                            _key.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Erro ao Alterar senha!"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            setState(() {
                              visivel = false;
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Trocar Hash'),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showDialog(
            context: context,
            child: TrocarHash(),
          );
        },
      ),
    );
  }
}
