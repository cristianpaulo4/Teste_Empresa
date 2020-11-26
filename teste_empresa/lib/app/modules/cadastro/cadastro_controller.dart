import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/cadastro/repository/cadastroRepository.dart';
import 'package:teste_empresa/app/modules/cadastro/repository/cadastroRepositoryInterface.dart';

part 'cadastro_controller.g.dart';

@Injectable()
class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  final ICadastroRepository _repository;
  _CadastroControllerBase(this._repository);

  @action
  Future<bool> cadastrarUsuario(UsuarioModel usuarioModel) async {
    if (await _repository.cadastrar(usuarioModel)) {
      return true;
    } else {
      return false;
    }
  }
}
