// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tela_lista_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TelaListaController = BindInject(
  (i) => TelaListaController(i<ITelaListarRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TelaListaController on _TelaListaControllerBase, Store {
  Computed<ObservableFuture<List<UsuarioModel>>> _$getUsuariosComputed;

  @override
  ObservableFuture<List<UsuarioModel>> get getUsuarios =>
      (_$getUsuariosComputed ??= Computed<ObservableFuture<List<UsuarioModel>>>(
              () => super.getUsuarios,
              name: '_TelaListaControllerBase.getUsuarios'))
          .value;

  final _$_futureAtom = Atom(name: '_TelaListaControllerBase._future');

  @override
  ObservableFuture<List<UsuarioModel>> get _future {
    _$_futureAtom.reportRead();
    return super._future;
  }

  @override
  set _future(ObservableFuture<List<UsuarioModel>> value) {
    _$_futureAtom.reportWrite(value, super._future, () {
      super._future = value;
    });
  }

  final _$_TelaListaControllerBaseActionController =
      ActionController(name: '_TelaListaControllerBase');

  @override
  Future<dynamic> listar() {
    final _$actionInfo = _$_TelaListaControllerBaseActionController.startAction(
        name: '_TelaListaControllerBase.listar');
    try {
      return super.listar();
    } finally {
      _$_TelaListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getUsuarios: ${getUsuarios}
    ''';
  }
}
