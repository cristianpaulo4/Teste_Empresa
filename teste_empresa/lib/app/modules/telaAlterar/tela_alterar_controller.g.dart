// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tela_alterar_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TelaAlterarController = BindInject(
  (i) => TelaAlterarController(i<ITelaAlterarRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TelaAlterarController on _TelaAlterarControllerBase, Store {
  final _$alterarUsuarioAsyncAction =
      AsyncAction('_TelaAlterarControllerBase.alterarUsuario');

  @override
  Future<bool> alterarUsuario(UsuarioModel usuarioModel) {
    return _$alterarUsuarioAsyncAction
        .run(() => super.alterarUsuario(usuarioModel));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
