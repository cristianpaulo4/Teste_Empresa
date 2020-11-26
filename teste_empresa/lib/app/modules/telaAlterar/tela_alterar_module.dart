import 'tela_alterar_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'tela_alterar_page.dart';

class TelaAlterarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TelaAlterarController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => TelaAlterarPage()),
      ];

  static Inject get to => Inject<TelaAlterarModule>.of();
}
