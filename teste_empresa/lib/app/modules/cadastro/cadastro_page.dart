import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/components_globais/botao.dart';
import 'package:teste_empresa/app/modules/components_globais/dialogo.dart';
import 'package:teste_empresa/app/modules/components_globais/input.dart';
import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  //use 'controller' variable to access controller
  GlobalKey<FormState> _globalKey = GlobalKey();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController _nome = TextEditingController();
  TextEditingController _dataNascimento = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
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
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Modular.to.pushReplacementNamed('/');
            },
          )
        ],
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
                titulo: 'Cadastrar',
                onPressed: () async {
                  if (_globalKey.currentState.validate()) {
                    if (!_email.text.contains("@")) {
                      _key.currentState.showSnackBar(
                        SnackBar(
                          content: Text("E-mail incorreto!"),
                          backgroundColor: Colors.black,
                        ),
                      );
                    } else {
                      visivel = true;
                      setState(() {});

                      bool res = await controller.cadastrarUsuario(
                        UsuarioModel(
                          nome: _nome.text,
                          dataNascimento: _dataNascimento.text,
                          email: _email.text,
                          senha: _senha.text,
                        ),
                      );
                      if (res) {
                        _key.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Cadastrado com sucesso!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        _key.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Erro ao cadastrar!"),
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
