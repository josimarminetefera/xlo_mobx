enum TipoUsuario { PARTICULAR, PROFISSIONAL }

class Usuario {
  Usuario({
    this.id,
    this.nome,
    this.email,
    this.telefone,
    this.senha,
    this.tipo = TipoUsuario.PARTICULAR,
    this.dataCriacao,
  });

  String id;
  String nome;
  String email;
  String telefone;
  String senha;
  TipoUsuario tipo;
  DateTime dataCriacao;

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $nome, email: $email, telefone: $telefone, senha: $senha, tipo: $tipo, dataCriacao: $dataCriacao}';
  }
}
