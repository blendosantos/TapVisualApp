const queryLogin = '''
query QueryLogin (\$email:String, \$pw: String) {
  Usuario(where: {email: {_eq: \$email}, pw: {_eq: \$pw}}) {
    id
    email
    nome
    fotoPerfil
  }
}
''';