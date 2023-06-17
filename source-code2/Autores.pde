class Nome {
  String nome;
  color cor;
  
  Nome(String nome, color cor) {
    this.nome = nome;
    this.cor = cor;
  }
  
  void exibir(int x, int y) {
    fill(cor);
    textSize(20);
    text("Nome: " + nome , x, y);
  }
}

class RA {
  String ra;
  color cor;
  
  RA(String ra, color cor) {
    this.ra = ra;
    this.cor = cor;
  }
  void exibir(int x, int y) {
    fill(cor);
    textSize(20);
    text("Ra: " + ra  , x, y);
  }
}
