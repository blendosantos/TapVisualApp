import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:tap_visual_app/app/app_module.dart';
import 'package:tap_visual_app/app/respositories/usuario_repository.dart';

class AppBloc extends BlocBase {
  
  var usuarioRespository = AppModule.to.getDependency<UsuarioRepository>();

  Future<bool> isUsuario() async {
    var usuario = await usuarioRespository.isUsuario();
    if (usuario != null) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
