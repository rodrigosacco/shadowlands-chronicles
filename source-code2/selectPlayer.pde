class SelectPlayerScreen {
PImage img[];
Button archerPlayer;
Button magePlayer;
Button necromantePlayer;

int indiceImagem = 0; // Índice da imagem atual
float tempoTroca = 0.1; // Tempo entre as trocas de imagem (em segundos)
float ultimaTroca = 0; // Tempo da última troca de imagem
boolean trocarImagem = true; // Variável para controlar a troca de imagem

  SelectPlayerScreen() {
  // Carregue as imagens de fundo
   img = new PImage[8];
   img[0] = loadImage("assets/backgrounds/battle0.png");
   img[1] = loadImage("assets/backgrounds/battle1.png");
   img[2] = loadImage("assets/backgrounds/battle2.png");
   img[3] = loadImage("assets/backgrounds/battle3.png");
   img[4] = loadImage("assets/backgrounds/battle4.png");
   img[5] = loadImage("assets/backgrounds/battle5.png");
   img[6] = loadImage("assets/backgrounds/battle6.png");
   img[7] = loadImage("assets/backgrounds/battle7.png");
   
   
   archerPlayer = new Button
  (
    508,18, 254,354, 
    "assets/personagens/archer.png", 
    "assets/personagens/archer.png"
  );
  magePlayer = new Button
  (
    118,18, 254,354, 
    "assets/personagens/mage.png", 
    "assets/personagens/mage.png"
  );
  necromantePlayer = new Button
  (
    898,18, 254,354, 
    "assets/personagens/necromante.png", 
    "assets/personagens/necromante.png"
  );
   
   frameRate(10); // Define a taxa de quadros por segundo para 10
  }
  
  
  void display() {
  background(0);
  // Exibe a imagem atual
  image(img[indiceImagem], 0, 0, 1280, height);

  // Verifica se é hora de trocar de imagem
  if (millis() - ultimaTroca > tempoTroca * 1000 && trocarImagem) {
    indiceImagem = (indiceImagem + 1) % img.length; // Alterna para a próxima imagem
    ultimaTroca = millis(); // Atualiza o tempo da última troca de imagem
   
  }
  

  // Desenhe dois retângulos na tela
  archerPlayer.update();
    archerPlayer.render();
    if(archerPlayer.isClicked())
    {
      menu = 6;
    } 
    
    magePlayer.update();
    magePlayer.render();
    if(magePlayer.isClicked())
    {
      menu = 5;
    } 
    
    necromantePlayer.update();
    necromantePlayer.render();
    if(necromantePlayer.isClicked())
    {
      menu = 0;
    } 
  
  // Insira as imagens nos retângulos
  // Substitua as coordenadas e dimensões das imagens pelos valores desejados
  // image(img1, 120, 120, 360, 360); // Retângulo 1
  // image(img2, 800, 120, 360, 360); // Retângulo 2
  
 // Desenhe a caixa de diálogo acima dos retângulos
  fill(80); // Cor verde escuro
  strokeWeight(2);
  rect(850, 620, 400, 60);
  
  fill(255);
  text("SELECT YOUR CHAMPION!", 1050 , 647);
  textSize(20);

  }
}
