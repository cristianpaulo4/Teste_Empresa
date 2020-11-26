import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/modules/alterarSenha/repository/alterarSenhaRepositoryInterface.dart';

part 'alterar_senha_controller.g.dart';

@Injectable()
class AlterarSenhaController = _AlterarSenhaControllerBase
    with _$AlterarSenhaController;

abstract class _AlterarSenhaControllerBase with Store {
  final IAlterarSenhaRepository _repository;
  _AlterarSenhaControllerBase(this._repository);

  Future<bool> alterarSenha(
      String email, String senha, String novaSenha) async {
    if (await _repository.alterarSenha(email, senha, novaSenha)) {
      print('Alterado');
      Modular.to.pop();
      return false;
    } else {
      print('Erro ao alterar');
      return true;
    }
  }
}
