import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/components_globais/botao.dart';
import 'package:teste_empresa/app/modules/components_globais/dialogo.dart';
import 'tela_lista_controller.dart';

class TelaListaPage extends StatefulWidget {
  final String title;
  const TelaListaPage({Key key, this.title = "Tela Lista"}) : super(key: key);

  @override
  _TelaListaPageState createState() => _TelaListaPageState();
}

class _TelaListaPageState
    extends ModularState<TelaListaPage, TelaListaController> {
  //use 'controller' variable to access controller
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.pushReplacementNamed('/home');
          },
        ),
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
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.listar();
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Modular.to.pushReplacementNamed('/');
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.getUsuarios.value == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.getUsuarios.value.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                        'Nome: ${controller.getUsuarios.value.elementAt(i).nome}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'E-mail:${controller.getUsuarios.value.elementAt(i).email}'),
                        Text(
                            'Data de Nascimento: ${controller.getUsuarios.value.elementAt(i).dataNascimento}'),
                        Text(
                            'Senha:${controller.getUsuarios.value.elementAt(i).senha}'),
                        Divider()
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            Modular.to.pushNamed('/alterar',
                                arguments:
                                    controller.getUsuarios.value.elementAt(i));
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _delete(
                                controller.getUsuarios.value.elementAt(i).sId);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
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

  _delete(String id) {
    showDialog(
      context: context,
      child: AlertDialog(
        content: Text('Deletar usuário?'),
        actions: [
          MaterialButton(
            child: Text('Não'),
            color: Colors.red,
            onPressed: () {
              Modular.to.pop();
            },
          ),
          MaterialButton(
            color: Colors.green,
            child: Text('Sim'),
            onPressed: () async {
              if (await controller.excluir(id)) {
                Modular.to.pop();
                _key.currentState.showSnackBar(
                  SnackBar(
                    content: Text("Excluido com sucesso!"),
                    backgroundColor: Colors.green,
                  ),
                );
                controller.listar();
              } else {
                Modular.to.pop();
                _key.currentState.showSnackBar(
                  SnackBar(
                    content: Text("Erro ao excluir"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
