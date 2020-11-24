enum TipoUsuario { PARTICULAR, PROFISSIONAL }

class Usuario {
  Usuario({
    this.nome,
    this.email,
    this.telefone,
    this.senha,
    this.tipo = TipoUsuario.PARTICULAR,
  });

  String nome;
  String email;
  String telefone;
  String senha;
  TipoUsuario tipo;
}
