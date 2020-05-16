class Perfil {
  String descricao;
  int id;

  Perfil({this.descricao, this.id});

  Perfil.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['id'] = this.id;
    return data;
  }
}

enum EPerfil {
  ADMINISTRADOR,
  BARBEIRO,
  SOLICITANTE
}

extension PerfilExtension on EPerfil {
  static const labels = {
    EPerfil.ADMINISTRADOR: "admin",
    EPerfil.BARBEIRO: "barber",
    EPerfil.SOLICITANTE: "client"
  };

  static const ids= {
    EPerfil.ADMINISTRADOR: 1,
    EPerfil.BARBEIRO: 2,
    EPerfil.SOLICITANTE: 3
  };

  String get label => labels[this];
  int get id => ids[this];
}