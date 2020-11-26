import 'alterar_senha_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'alterar_senha_page.dart';

class AlterarSenhaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AlterarSenhaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AlterarSenhaPage()),
      ];

  static Inject get to => Inject<AlterarSenhaModule>.of();
}
