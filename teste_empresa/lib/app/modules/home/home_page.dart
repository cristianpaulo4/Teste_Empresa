import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/modules/components_globais/botao.dart';
import 'package:teste_empresa/app/modules/components_globais/dialogo.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Botao(
            titulo: 'Listar Usuário',
            onPressed: () {
              Modular.to.pushReplacementNamed('/listar');
            },
          ),
        ],
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
