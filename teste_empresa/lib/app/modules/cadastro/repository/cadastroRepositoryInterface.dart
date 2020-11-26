import 'package:teste_empresa/app/model/usuarioModel.dart';

abstract class ICadastroRepository {
  // cadastrar
  Future<bool> cadastrar(UsuarioModel usuarioModel);
}
