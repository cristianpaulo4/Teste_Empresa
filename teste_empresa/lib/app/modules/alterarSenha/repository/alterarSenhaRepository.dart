import 'package:dio/dio.dart';
import 'package:teste_empresa/app/modules/alterarSenha/repository/alterarSenhaRepositoryInterface.dart';
import 'package:teste_empresa/app/modules/utls/utls.dart';

class AlterarSenhaRepository implements IAlterarSenhaRepository {
  final Dio dio;
  AlterarSenhaRepository(this.dio);

  @override
  Future<bool> alterarSenha(String email, String senha, String nova) async {
    Response res = await dio.get('https://crudcrud.com/api/$apiHash/user');
    List list = res.data;
    bool existe = false;
    String id;
    var usuario;

    list.forEach((element) {
      if (element['email'] == email && element['senha'] == senha) {
        id = element['_id'];
        usuario = element;
        existe = true;
      }
    });
    // alterar senha
    if (existe) {
      Response response = await dio.put(
        "https://crudcrud.com/api/$apiHash/user/${usuario['_id']}",
        data: {
          "nome": usuario['nome'],
          "dataNascimento": usuario['dataNascimento'],
          "email": email,
          "senha": nova
        },
      );
      return true;
    }
    return false;
  }
}
