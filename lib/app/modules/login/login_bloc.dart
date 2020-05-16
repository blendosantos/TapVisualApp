import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tap_visual_app/app/app_module.dart';
import 'package:tap_visual_app/app/models/Usuario.dart';
import 'package:tap_visual_app/app/respositories/usuario_repository.dart';
import 'package:tap_visual_app/app/shared/StatusState.dart';

class LoginBloc extends BlocBase {

  final usuarioRepository = AppModule.to.getDependency<UsuarioRepository>();

  final _stateController = BehaviorSubject<StatusDefault>();
  Stream<StatusDefault> get outState => _stateController.stream;
  
  Future<dynamic> submitLogin(String login, String pw) async {    
    _stateController.add(StatusDefault.LOADING);
    Usuario usuario = await usuarioRepository.actionLogin(login, pw);
    if (usuario != null) {
      _stateController.add(StatusDefault.SUCCESS);
    } else {
      _stateController.add(StatusDefault.NOTFOUND);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _stateController.close();
  }
}
