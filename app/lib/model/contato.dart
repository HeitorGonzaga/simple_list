class Contato {
  String nome;
  String telefone;

  Contato(this.nome, this.telefone);

  Contato.fromJson(Map json)
      : nome = json['nome'],
        telefone = json['telefone'];
}
