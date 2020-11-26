import 'package:dio/dio.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/telaLista/repository/telaListarRepositoryInterface.dart';
import 'package:teste_empresa/app/modules/utls/utls.dart';

class TelaListarRepository implements ITelaListarRepository {
  final Dio dio;
  TelaListarRepository(this.dio);

  @override
  Future<List<UsuarioModel>> listarUsuario() async {
    Response res = await dio.get('https://crudcrud.com/api/$apiHash/user');
    List<UsuarioModel> list = List();
    List dados = res.data;

    dados.forEach((element) {
      list.add(UsuarioModel.fromJson(element));
    });

    return list;
  }

  @override
  Future<bool> excluir(String id) async {
    Response res =
        await dio.delete('https://crudcrud.com/api/$apiHash/user/$id');
    print(res.statusCode);
    return res.statusCode == 200;
  }
}
