class RulesScreen {
  PImage setas;
  PImage espaco;
  RulesScreen(){
  setas = loadImage("assets/movimentacao/teclasMovimento.png");
  espaco = loadImage("assets/movimentacao/teclaShoot.png");
  }
  void display() {
    background(bg);
    fill(255);
    textSize(30);
    textFont(font1);
    text("Regras", width/2, 70);
    
    
    image(setas, 150, 460,200,100);
    image(espaco, 600, 480,100,48);
    
    fill(0, 408, 612);
    textSize(24);
    //titulo primeira linha
    text("Objetivo: ", 280, 160);
    text("Personagens:", 650 , 160);
    text("Regras de Colisão:", 1050, 160);
    //titulo segunda coluna
    text("Movimentação:", 280, 360);
    text("Disparo:", 660, 360);
    text("Pontuação:" , 1040 , 360);


    fill(255);
    textSize(20);
    //textos primeira linha
    text("O objetivo do jogo é derrotar os monstros através de disparos precisos enquanto evita ser atingido.", 100, 180, 350,120 );
    text("Personagem 1: ARQUEIRO Personagem 2: MAGO Personagem 3: necromancer", 520, 160, 250,120 );
    text("- Quando o jogador é atingido pelos monstros, ele perde meia vida.", 870, 160, 350,120 );
    text("- O jogo continua até que um jogador perca todas as suas vidas.", 870, 230, 350,120 );
    
    //textos segunda coluna
    text("Use as setas do teclado para mover para cima, baixo, esquerda e direita.", 100, 360, 350,120 );
    text(" Pressione a tecla de espaço para disparar.", 550, 360, 200,120 );
    text("- A cada 30 segundos aumenta o número de monstros.", 870, 360, 350,120 );
    text("- O jogo tem um tempo total de 5 minutos.", 870, 430, 350,120 );
    

    
    
  
    
    ReturnButton.update();
    ReturnButton.render();
    if(ReturnButton.isClicked())
    {
      menu = 0;
    }
  }
}
