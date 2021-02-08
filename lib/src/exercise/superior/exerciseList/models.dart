class Treino {
  String nome, nivel, tipo;

  Treino({this.nome, this.nivel, this.tipo});

  factory Treino.fromJson(Map<String, dynamic> json) {
    return Treino(
      nome: json['nome'],
      nivel: json['nivel'],
      tipo: json['tipo'],
      
    );
  }
}