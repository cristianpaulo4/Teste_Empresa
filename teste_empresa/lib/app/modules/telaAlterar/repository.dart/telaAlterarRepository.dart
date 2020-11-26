import 'package:dio/dio.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/telaAlterar/repository.dart/telaAlterarRepositoryInterface.dart';
import 'package:teste_empresa/app/modules/utls/utls.dart';

class TelaAlterarRepository implements ITelaAlterarRepository {
  final Dio dio;
  TelaAlterarRepository(this.dio);

  @override
  Future<bool> alterar(UsuarioModel usuarioModel) async {
    // alterar senha

    Response response = await dio.put(
      "https://crudcrud.com/api/$apiHash/user/${usuarioModel.sId}",
      data: {
        "nome": usuarioModel.nome,
        "dataNascimento": usuarioModel.dataNascimento,
        "email": usuarioModel.email,
        "senha": usuarioModel.senha
      },
    );

    print(response.statusCode);

    return true;
  }
}
