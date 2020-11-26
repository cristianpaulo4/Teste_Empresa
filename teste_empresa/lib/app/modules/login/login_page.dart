import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/modules/components_globais/botao.dart';
import 'package:teste_empresa/app/modules/components_globais/dialogo.dart';
import 'package:teste_empresa/app/modules/components_globais/input.dart';
import 'package:teste_empresa/app/modules/utls/utls.dart';
import 'login_controller.dart';
import 'package:crypto/crypto.dart' as crypto;

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  GlobalKey<FormState> _globalKey = GlobalKey();
  GlobalKey<ScaffoldState> _key = GlobalKey();
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
                      label: 'Senha',
                      erro: 'Digite a senha',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Botao(
                      titulo: 'Login',
                      onPressed: () async {
                        if (apiHash.isEmpty) {
                          _key.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Adicione o Hash da API"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          String _pw_cripitografada = crypto.md5
                              .convert(utf8.encode(_senha.text))
                              .toString();

                          if (_globalKey.currentState.validate()) {
                            if (!_email.text.contains("@")) {
                              _key.currentState.showSnackBar(
                                SnackBar(
                                  content: Text("E-mail incorreto!"),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            } else {
                              setState(() {
                                visivel = true;
                              });
                              if (await controller.login(
                                  _email.text, _pw_cripitografada)) {
                              } else {
                                setState(() {
                                  visivel = false;
                                });
                                _key.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Usuario ou senha incorretas!"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          }
                        }
                      },
                    ),
                    Divider(
                      color: Colors.black45,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton.icon(
                            label: Text('Trocar Senha'),
                            icon: Icon(Icons.refresh),
                            textColor: Colors.blue,
                            onPressed: () {
                              if (apiHash.isEmpty) {
                                _key.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text("Adicione o Hash da API"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                Modular.to.pushNamed('/alterar_senha');
                              }
                            },
                          ),
                          FlatButton.icon(
                            label: Text('Cadastre-se'),
                            textColor: Colors.green,
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              if (apiHash.isEmpty) {
                                _key.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text("Adicione o Hash da API"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                Modular.to.pushNamed('/cadastro');
                              }
                            },
                          ),
                        ],
                      ),
                    )
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
        backgroundColor: Colors.deepPurple,
        label: Text('Trocar Hash'),
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
