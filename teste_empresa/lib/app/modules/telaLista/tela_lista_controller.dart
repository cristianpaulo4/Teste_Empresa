import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_empresa/app/model/usuarioModel.dart';
import 'package:teste_empresa/app/modules/telaLista/repository/telaListarRepositoryInterface.dart';

part 'tela_lista_controller.g.dart';

@Injectable()
class TelaListaController = _TelaListaControllerBase with _$TelaListaController;

abstract class _TelaListaControllerBase with Store {
  final ITelaListarRepository _repository;
  _TelaListaControllerBase(this._repository) {
    listar();
  }

  @observable
  ObservableFuture<List<UsuarioModel>> _future;

  @action
  Future listar() {
    _future = this._repository.listarUsuario().asObservable();
  }

  Future<bool> excluir(String id) async {
    return await this._repository.excluir(id);
  }

  @computed
  ObservableFuture<List<UsuarioModel>> get getUsuarios => this._future;
}
