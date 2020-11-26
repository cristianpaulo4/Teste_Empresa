import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/components_globais/botao.dart';
import 'package:teste_empresa/app/modules/components_globais/dialogo.dart';
import 'package:teste_empresa/app/modules/components_globais/input.dart';
import 'tela_alterar_controller.dart';
import 'package:crypto/crypto.dart' as crypto;

class TelaAlterarPage extends StatefulWidget {
  final UsuarioModel usuarioModel;
  final String title;
  const TelaAlterarPage(
      {Key key, this.title = "Alterar Dados", this.usuarioModel})
      : super(key: key);

  @override
  _TelaAlterarPageState createState() => _TelaAlterarPageState();
}

class _TelaAlterarPageState
    extends ModularState<TelaAlterarPage, TelaAlterarController> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController _nome = TextEditingController();
  TextEditingController _dataNascimento = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  bool visivel = false;

  @override
  void initState() {
    _nome.text = widget.usuarioModel.nome;
    _dataNascimento.text = widget.usuarioModel.dataNascimento;
    _email.text = widget.usuarioModel.email;
    _senha.text = widget.usuarioModel.senha;

    print(widget.usuarioModel.senha);

    //crypto.md5.convert(utf8.decode(widget.usuarioModel.senha));
    super.initState();
  }

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
        child: Form(
          key: _globalKey,
          child: Column(
            children: <Widget>[
              Visibility(
                visible: visivel,
                child: LinearProgressIndicator(backgroundColor: Colors.white),
              ),
              Input(
                label: 'Nome',
                controller: _nome,
                erro: 'Digite o nome',
              ),
              Input(
                label: 'Data de Nascimento',
                controller: _dataNascimento,
                erro: 'Digite a data de nascimento',
                type: TextInputType.datetime,
              ),
              Input(
                label: 'E-mail',
                controller: _email,
                erro: 'Digite o e-mail',
                type: TextInputType.emailAddress,
              ),
              Input(
                label: 'Senha',
                controller: _senha,
                erro: 'Digite a senha',
              ),
              SizedBox(
                height: 30,
              ),
              Botao(
                titulo: 'Alterar Dados',
                onPressed: () async {
                  if (_globalKey.currentState.validate()) {
                    if (!_email.text.contains('@')) {
                      _key.currentState.showSnackBar(
                        SnackBar(
                          content: Text("E-mail incorreto!"),
                          backgroundColor: Colors.black,
                        ),
                      );
                    } else {
                      String _pw_cripitografada = crypto.md5
                          .convert(utf8.encode(_senha.text))
                          .toString();

                      visivel = true;

                      setState(() {});

                      bool res = await controller.alterarUsuario(
                        UsuarioModel(
                          sId: widget.usuarioModel.sId,
                          nome: _nome.text,
                          dataNascimento: _dataNascimento.text,
                          email: _email.text,
                          senha: _pw_cripitografada,
                        ),
                      );
                      if (res) {
                        _key.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Alterado com sucesso!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        _key.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Erro ao Alterar!"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  }
                },
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
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
