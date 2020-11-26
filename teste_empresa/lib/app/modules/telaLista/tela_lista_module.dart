import 'tela_lista_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'tela_lista_page.dart';

class TelaListaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TelaListaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => TelaListaPage()),
      ];

  static Inject get to => Inject<TelaListaModule>.of();
}
