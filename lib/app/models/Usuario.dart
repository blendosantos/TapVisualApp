import 'package:tap_visual_app/app/models/Perfil.dart';

class Usuario {
  String nome;
  int id;
  String email;
  String fotoPerfil;
  String telefone;
  Perfil perfil;

  Usuario(
      {this.nome,
      this.id,
      this.email,
      this.fotoPerfil,
      this.telefone,
      this.perfil});

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'] != null ? json['nome'] : null;
    id = json['id'] != null ? json['id'] : null;
    email = json['email'] != null ? json['email'] : null;
    fotoPerfil = json['fotoPerfil'] != null ? json['fotoPerfil'] : null;
    telefone = json['telefone'] != null ? json['telefone'] : null;
    perfil =
        json['Perfil'] != null ? new Perfil.fromJson(json['Perfil']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['id'] = this.id;
    data['email'] = this.email;
    data['fotoPerfil'] = this.fotoPerfil;
    data['telefone'] = this.telefone;
    if (this.perfil != null) {
      data['Perfil'] = this.perfil.toJson();
    }
    return data;
  }
}