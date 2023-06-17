class HistoryScreen {

PImage[] imagens; // Array para armazenar as imagens
int indiceImagem = 0; // Índice da imagem atual
float velocidadeTexto = 9; // Velocidade de movimento do texto
float posicaoTexto = 0; // Posição vertical inicial do texto
float tempoTroca = 0.1; // Tempo entre as trocas de imagem (em segundos)
float ultimaTroca = 0; // Tempo da última troca de imagem
boolean trocarImagem = true; // Variável para controlar a troca de imagem
PFont fonteTexto;

String[] paragrafos = {
  "Nas profundezas sombrias da terra, onde os raios de sol mal conseguem penetrar",
  "Existe uma torre envolta em mistério e escuridão, conhecida como a Torre das Sombras",
  "Ela se ergue majestosamente diante de um caçador destemido",
  "Um herói corajoso que jurou proteger o mundo dos horrores que habitam seu interior",
  "Este é o início de uma jornada épica, uma saga de coragem e sacrifício conhecida como..."
};
int indiceParagrafo = 0; // Índice do parágrafo atual

HistoryScreen() {
  size(1280, 720); // Tamanho da janela do Processing
  
  fonteTexto = createFont("fonts/fontHistory.ttf", 20);
  
  // Carrega as imagens em um array
  imagens = new PImage[36];
  imagens[0] = loadImage("assets/history/frame_00_delay-0.1s.png");
  imagens[1] = loadImage("assets/history/frame_01_delay-0.1s.png");
  imagens[2] = loadImage("assets/history/frame_02_delay-0.1s.png");
  imagens[3] = loadImage("assets/history/frame_03_delay-0.1s.png");
  imagens[4] = loadImage("assets/history/frame_04_delay-0.1s.png");
  imagens[5] = loadImage("assets/history/frame_05_delay-0.1s.png");
  imagens[6] = loadImage("assets/history/frame_06_delay-0.1s.png");
  imagens[7] = loadImage("assets/history/frame_07_delay-0.1s.png");
  imagens[8] = loadImage("assets/history/frame_08_delay-0.1s.png");
  imagens[9] = loadImage("assets/history/frame_09_delay-0.1s.png");
  imagens[10] = loadImage("assets/history/frame_10_delay-0.1s.png");
  imagens[11] = loadImage("assets/history/frame_11_delay-0.1s.png");
  imagens[12] = loadImage("assets/history/frame_12_delay-0.1s.png");
  imagens[13] = loadImage("assets/history/frame_13_delay-0.1s.png");
  imagens[14] = loadImage("assets/history/frame_14_delay-0.1s.png");
  imagens[15] = loadImage("assets/history/frame_15_delay-0.1s.png");
  imagens[16] = loadImage("assets/history/frame_16_delay-0.1s.png");
  imagens[17] = loadImage("assets/history/frame_17_delay-0.1s.png");
  imagens[18] = loadImage("assets/history/frame_18_delay-0.1s.png");
  imagens[19] = loadImage("assets/history/frame_19_delay-0.1s.png");
  imagens[20] = loadImage("assets/history/frame_20_delay-0.1s.png");
  imagens[21] = loadImage("assets/history/frame_21_delay-0.1s.png");
  imagens[22] = loadImage("assets/history/frame_22_delay-0.1s.png");
  imagens[23] = loadImage("assets/history/frame_23_delay-0.1s.png");
  imagens[24] = loadImage("assets/history/frame_24_delay-0.1s.png");
  imagens[25] = loadImage("assets/history/frame_25_delay-0.1s.png");
  imagens[26] = loadImage("assets/history/frame_26_delay-0.1s.png");
  imagens[27] = loadImage("assets/history/frame_27_delay-0.1s.png");
  imagens[28] = loadImage("assets/history/frame_28_delay-0.1s.png");
  imagens[29] = loadImage("assets/history/frame_29_delay-0.1s.png");
  imagens[30] = loadImage("assets/history/frame_30_delay-0.1s.png");
  imagens[31] = loadImage("assets/history/frame_31_delay-0.1s.png");
  imagens[32] = loadImage("assets/history/frame_32_delay-0.1s.png");
  imagens[33] = loadImage("assets/history/frame_33_delay-0.1s.png");
  imagens[34] = loadImage("assets/history/frame_34_delay-0.1s.png");
  imagens[35] = loadImage("assets/history/frame_35_delay-0.1s.png");
  
  frameRate(10); // Define a taxa de quadros por segundo para 10
}


void display() {
  background(0); // Limpa a tela

  // Exibe a imagem atual
  image(imagens[indiceImagem], 380, 0, 530, height);

  textFont(fonteTexto);

  // Move o texto
  posicaoTexto += velocidadeTexto;

  // Verifica se é hora de trocar de imagem
  if (millis() - ultimaTroca > tempoTroca * 1000 && trocarImagem) {
    indiceImagem = (indiceImagem + 1) % imagens.length; // Alterna para a próxima imagem
    ultimaTroca = millis(); // Atualiza o tempo da última troca de imagem
  }

  // Exibe o texto
  fill(255); // Cor do texto
  strokeWeight(1);
  textSize(15); // Tamanho da fonte
  textAlign(CENTER, TOP); // Alinhamento do texto
  
  // Exibe o parágrafo atual
  String paragrafoAtual = paragrafos[indiceParagrafo];
  float alturaTexto = textAscent() + textDescent();
  float margemHorizontal = 20; // Espaço para margens esquerda e direita
  
  float posY = posicaoTexto % (height + alturaTexto); // Ajuste para permitir que o texto repita
  
  float y = posY;
  int linhaAtual = 0;
  
  while (y < height) {
    String linha = "";
    float larguraLinha = 0;
    
    int indicePalavra = 0;
    String[] palavras = paragrafoAtual.split(" ");
    
    while (indicePalavra < palavras.length && larguraLinha < width - 2 * margemHorizontal) {
      String palavra = palavras[indicePalavra];
      String possivelLinha = linha + palavra + " ";
      float larguraPossivelLinha = textWidth(possivelLinha);
      
      if (larguraPossivelLinha < width - 2 * margemHorizontal) {
        linha = possivelLinha;
        larguraLinha = larguraPossivelLinha;
        indicePalavra++;
      } else {
        break;
      }
    }
    
    // Exibe a linha atual
    float x = width / 2;
    float yAtual = y + linhaAtual * alturaTexto;
    text(linha.trim(), x, yAtual);
    
    linhaAtual++;
    y += alturaTexto;
    
    if (indicePalavra >= palavras.length) {
      break;
    }
  }

  // Verifica se o texto atingiu a parte inferior da tela
  if (posicaoTexto > height + alturaTexto) {
    posicaoTexto = -alturaTexto; // Reinicia o texto acima da tela
    indiceParagrafo++; // Avança para o próximo parágrafo
  }
    // Verifica se chegou ao último parágrafo
    if (indiceParagrafo >= paragrafos.length) {
      noLoop();
      //Colocar passagem para o menu!
    }
     ReturnButton.update();
    ReturnButton.render();
    if(ReturnButton.isClicked())
    {
      menu = 0;
    }
}
}
