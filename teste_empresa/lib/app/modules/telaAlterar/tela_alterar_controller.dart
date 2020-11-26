import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/telaAlterar/repository.dart/telaAlterarRepositoryInterface.dart';

part 'tela_alterar_controller.g.dart';

@Injectable()
class TelaAlterarController = _TelaAlterarControllerBase
    with _$TelaAlterarController;

abstract class _TelaAlterarControllerBase with Store {
  final ITelaAlterarRepository _repository;
  _TelaAlterarControllerBase(this._repository);

  @action
  Future<bool> alterarUsuario(UsuarioModel usuarioModel) async {
    if (await _repository.alterar(usuarioModel)) {
      print('Alerado');
      return true;
    } else {
      print('Erro ao alterar');
      return false;
    }
  }
}
