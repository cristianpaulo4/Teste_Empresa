import 'package:teste_empresa/app/model/usuarioModel.dart';

abstract class ITelaAlterarRepository {
  // alterar
  Future<bool> alterar(UsuarioModel usuarioModel);
}
