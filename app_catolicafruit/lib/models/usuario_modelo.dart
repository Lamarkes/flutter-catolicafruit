class Usuario {
  String? nome;
  String? email;
  String? telefone;

  Usuario({
    required this.nome,
    required this.email,
    required this.telefone,
  });

  @override
  String toString() {
    return "{Usuario: nome=$nome}";
  }
}
