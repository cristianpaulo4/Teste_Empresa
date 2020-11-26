import 'package:teste_empresa/app/model/usuarioModel.dart';

abstract class ITelaListarRepository {
  // listar
  Future<List<UsuarioModel>> listarUsuario();

  // excluir
  Future<bool> excluir(String id);
}
