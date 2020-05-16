import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:tap_visual_app/app/app_module.dart';
import 'package:tap_visual_app/app/respositories/usuario_repository.dart';

class HomeBloc extends BlocBase {
  
  final usuarioRepository = AppModule.to.getDependency<UsuarioRepository>();

  Future<dynamic> logoff() async {
    await usuarioRepository.logoff();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
