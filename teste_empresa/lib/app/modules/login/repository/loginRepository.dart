import 'package:dio/dio.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/login/repository/loginRepositoryInterface.dart';
import 'package:teste_empresa/app/modules/utls/utls.dart';

class LoginRepository extends ILoginRepository {
  final Dio dio;
  LoginRepository(this.dio);

  @override
  Future<bool> bucarUsuario(String email, String senha) async {
    Response res = await dio.get('https://crudcrud.com/api/$apiHash/user');
    List list = res.data;
    bool existe = false;

    list.forEach((element) {
      if (element['email'] == email && element['senha'] == senha) {
        existe = true;
      }
    });
    return existe;
  }
}
