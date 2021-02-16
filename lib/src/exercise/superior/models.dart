class Exercicio {
  String nome;
  int intervalo;
  final repeticao;
  int series;

  Exercicio({this.nome, this.intervalo, this.repeticao, this.series});

  getNome() {
    return this.nome;
  }

  getIntervalo() {
    return this.intervalo;
  }

  getRepeticao() {
    return this.repeticao;
  }

  getSeries() {
    return this.series;
  }
}

main() {
  var exercicio_1 =
      new Exercicio(nome: "Flexão", intervalo: 30, repeticao: 12, series: 3);

  print(exercicio_1.getNome());
}
