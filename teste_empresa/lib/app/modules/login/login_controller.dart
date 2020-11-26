import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/modules/login/repository/loginRepositoryInterface.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILoginRepository _repository;
  _LoginControllerBase(this._repository);

  @action
  Future<bool> login(String email, String senha) async {
    if (await _repository.bucarUsuario(email, senha)) {
      print('Existe!');
      Modular.to.pushReplacementNamed('/home');

      return true;
    } else {
      print('Não existe!');
      return false;
    }
  }
}
