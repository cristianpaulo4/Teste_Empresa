import 'dart:convert';

import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/cadastro/repository/cadastroRepositoryInterface.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:teste_empresa/app/modules/utls/utls.dart';

class CadastroRepository extends ICadastroRepository {
  final Dio dio;

  CadastroRepository(this.dio);

  @override
  Future<bool> cadastrar(UsuarioModel usuarioModel) async {
    Response response = await dio.post(
      "https://crudcrud.com/api/$apiHash/user",
      data: {
        "nome": usuarioModel.nome,
        "dataNascimento": usuarioModel.dataNascimento,
        "email": usuarioModel.email,
        "senha": crypto.md5.convert(utf8.encode(usuarioModel.senha)).toString()
      },
    );

    return response.statusCode == 201;
  }
}
