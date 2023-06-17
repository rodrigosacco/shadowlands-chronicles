class Enemy{
  //variables
  float x;
  float y;
  int w;
  int h;
  
  float velocidadeInimigos = 3.5; 
  
  float left; 
  float right;
  float top;
  float bottom;
  
  boolean shouldRemove;
  PImage sprite;
  //constructor
  Enemy(float startingX, float startingY, int startingW, int startingH){

   this.x = startingX;
   this.y = startingY;
   this.w = startingW;
   this.h = startingH;
   
    left = x - w/2;
    right = x + w/2;
    top = y - w/2;
    bottom = y + w/2;
    
    shouldRemove = false;
  }
  
  void render(){
    rectMode(CENTER); 
  if (quantidadeInimigos % 2 == 0 && quantidadeInimigos % 3 == 0) {
    sprite = loadImage("assets/enemy/vampire.png"); // Defina a sprite desejada
  }
  else if (quantidadeInimigos % 2 == 0 && quantidadeInimigos % 5 == 0) {
    sprite = loadImage("assets/enemy/wraith.png"); // Defina a sprite desejada
  }
  // Verifica se tempoRestante é múltiplo de 3 e 5 simultaneamente
  else if (quantidadeInimigos % 3 == 0 && quantidadeInimigos % 5 == 0) {
    sprite = loadImage("assets/enemy/big_demon.png"); // Defina a sprite desejada
  }
  else if (quantidadeInimigos % 2 == 0 && quantidadeInimigos % 3 == 0 && quantidadeInimigos % 5 == 0) {
    sprite = loadImage("assets/enemy/bat.png"); // Defina a sprite desejada
  }
  // Verifica se tempoRestante é múltiplo de 2
  else if(quantidadeInimigos % 2 == 0) {
    sprite = loadImage("assets/enemy/vampire.png");
  }
  // Verifica se tempoRestante é múltiplo de 3
  else if (quantidadeInimigos % 3 == 0) {
    sprite = loadImage("assets/enemy/wraith.png");
  }
  // Caso contrário, usa a sprite padrão
  else {
    sprite = loadImage("assets/enemy/skeleton.png");
  }
    image(sprite,x, y, w, h);
    
  }
  
  void update(Player p1){
    float direcaoX = p1.x - x;
    float direcaoY = p1.y - y;
    
    float comprimento = sqrt(direcaoX * direcaoX + direcaoY * direcaoY);
    direcaoX /= comprimento;
    direcaoY /= comprimento;
    
    x += direcaoX * velocidadeInimigos;
    y += direcaoY * velocidadeInimigos;
    
    left = x - w/2;
    right = x + w/2;
    top = y - w/2;
    bottom = y + w/2;
  }
  
}
