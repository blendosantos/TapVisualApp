import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crypto/crypto.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:tap_visual_app/app/models/Usuario.dart';
import 'package:tap_visual_app/app/respositories/documents/usuario_doc.dart';
import 'package:tap_visual_app/app/respositories/shared_pref.dart';

class UsuarioRepository extends Disposable {
  final HasuraConnect hasura;

  SharedPref sharedPref = SharedPref();

  UsuarioRepository(this.hasura);

  Future<Usuario> actionLogin(String login, String senha) async {
    String pwEnconde = sha256.convert(utf8.encode(senha)).toString();
    return await this.hasura.query(queryLogin, variables: {'email' : login, 'pw' : pwEnconde}).then((value) async => await _validateUsuario(value));
  }

  Future<Usuario> isUsuario() async {
    var jsonString = await sharedPref.readJson('usuario') ?? null;
    if (jsonString != null) {
      return Usuario.fromJson(jsonString);
    }
    return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  Future<Usuario> _validateUsuario(Map<String, dynamic> value) async {
    var validate = _validQuery(value);
    if (validate != null) {
      var usuario = Usuario.fromJson(validate);
      await sharedPref.saveJson("usuario", usuario.toJson());
      return usuario;
    }
    return null;
  }

  Map<String, dynamic> _validQuery(dynamic value) {
    var listData = (value['data']['Usuario'] as List);
    if (listData.length > 0) {
      return listData[0];
    }
    return null;
  }

  Future<dynamic> logoff() async {
    await sharedPref.remove('usuario');
  }
}
