import 'package:dio/dio.dart';
import 'package:teste_empresa/app/modules/alterarSenha/alterar_senha_controller.dart';
import 'package:teste_empresa/app/modules/alterarSenha/alterar_senha_page.dart';
import 'package:teste_empresa/app/modules/alterarSenha/repository/alterarSenhaRepository.dart';
import 'package:teste_empresa/app/modules/cadastro/cadastro_controller.dart';
import 'package:teste_empresa/app/modules/cadastro/cadastro_page.dart';
import 'package:teste_empresa/app/modules/cadastro/repository/cadastroRepository.dart';
import 'package:teste_empresa/app/modules/home/home_controller.dart';
import 'package:teste_empresa/app/modules/home/home_page.dart';
import 'package:teste_empresa/app/modules/login/login_controller.dart';
import 'package:teste_empresa/app/modules/login/login_module.dart';
import 'package:teste_empresa/app/modules/login/repository/loginRepository.dart';
import 'package:teste_empresa/app/modules/telaAlterar/repository.dart/telaAlterarRepository.dart';
import 'package:teste_empresa/app/modules/telaAlterar/tela_alterar_controller.dart';
import 'package:teste_empresa/app/modules/telaAlterar/tela_alterar_page.dart';
import 'package:teste_empresa/app/modules/telaLista/repository/telaListarRepository.dart';
import 'package:teste_empresa/app/modules/telaLista/tela_lista_controller.dart';
import 'package:teste_empresa/app/modules/telaLista/tela_lista_page.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:teste_empresa/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => Dio()),
        Bind((i) => CadastroRepository(i.get())),
        Bind((i) => CadastroController(i.get())),
        Bind((i) => LoginRepository(i.get())),
        Bind((i) => LoginController(i.get())),
        Bind((i) => AlterarSenhaRepository(i.get())),
        Bind((i) => AlterarSenhaController(i.get())),
        $HomeController,
        $AlterarSenhaController,
        Bind((i) => TelaListarRepository(i.get())),
        Bind((i) => TelaListaController(i.get())),
        Bind((i) => TelaAlterarController(i.get())),
        Bind((i) => TelaAlterarRepository(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter('/home', child: (_, args) => HomePage()),
        ModularRouter('/alterar_senha', child: (_, args) => AlterarSenhaPage()),
        ModularRouter('/listar', child: (_, args) => TelaListaPage()),
        ModularRouter('/cadastro', child: (_, args) => CadastroPage()),
        ModularRouter('/alterar',
            child: (_, args) => TelaAlterarPage(
                  usuarioModel: args.data,
                )),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
