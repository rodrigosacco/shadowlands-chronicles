//variaveis para tela que irá iniciar o jogo
int menu = 0;
String playerSelected = "Archer";

//botões
Button1 StartButton;
Button1 AuthorButton;
Button1 RulesButton;
Button1 ReturnButton;
Button1 MenuButton;
Button1 ReviverButton;
Button1 HistoryButton;

//telas
MenuScreen menuScreen;
RulesScreen rulesScreen;
GameScreen gameScreen;
GameScreen2 gameScreen2;
GameOverScreen gameOverScreen;
SelectPlayerScreen selectPlayerScreen;
HistoryScreen historyScreen;


//autores
Nome nome1;
RA ra1;
Nome nome2;
RA ra2;
Nome nome3;
RA ra3;

//images
PImage bg;
PImage logo;
PImage gameOverLogo;
PFont font1;
PImage bgGame;
PImage bulletImage1;
PImage bulletImage2;
PImage bgModal;

//player
int tempoRestante = 300;
int intervaloSpawn = 10;
int quantidadeInimigos = 5;
float distanciaSpawn = 500;

//bullet
int x;
  int y;
  int d;
  int speed;
  int dirX;
  int dirY;
  
  boolean shouldRemove;
  
  int left; 
  int right;
  int top;
  int bottom;
  
  PImage imgRight;
  PImage imgLeft;
  PImage imgUp;
  PImage imgDown;
  
//sons
import processing.sound.*;
SoundFile sound;

//sons jogo
SoundFile HealthLoss;
SoundFile enemyHit;
SoundFile towerMusic;
SoundFile arrow;
SoundFile magic;
SoundFile skull;

//modal
boolean showModal = false;
Button close;

  
void setup()
{
  size(1280, 720);
  PImage[] leftImages = new PImage[6];
  leftImages[0] = loadImage("assets/setas/Setas (1).png");
  leftImages[1] = loadImage("assets/setas/Setas (2).png");
  leftImages[2] = loadImage("assets/setas/Setas (3).png");
  leftImages[3] = loadImage("assets/setas/Setas (4).png");
  leftImages[4] = loadImage("assets/setas/Setas (5).png");
  leftImages[5] = loadImage("assets/setas/Setas (6).png");
  
  PImage[] rightImages = new PImage[6];
  rightImages[0] = loadImage("assets/setas/Setas-(1)R.png");
  rightImages[1] = loadImage("assets/setas/Setas-(2)R.png");
  rightImages[2] = loadImage("assets/setas/Setas-(3)R.png");
  rightImages[3] = loadImage("assets/setas/Setas-(4)R.png");
  rightImages[4] = loadImage("assets/setas/Setas-(5)R.png");
  rightImages[5] = loadImage("assets/setas/Setas-(6)R.png");

   //botões
  StartButton = new Button1
  (
    540,400,120,70, 
   "assets/buttons/StartButton01.png", "assets/buttons/StartButton02.png", leftImages, rightImages
  );
  AuthorButton = new Button1
  (
    380,400,120,70,  
    "assets/buttons/CreditsButton01.png", 
    "assets/buttons/CreditsButton02.png",
    leftImages, rightImages

  );
  RulesButton = new Button1
  (
    700,400,120,70,  
    "assets/buttons/RulesButton01.png", 
    "assets/buttons/RulesButton02.png",
    leftImages, rightImages
  );
  
  HistoryButton = new Button1
  (
    540,470,120,70,  
    "assets/buttons/RulesButton01.png", 
    "assets/buttons/RulesButton02.png",
    leftImages, rightImages
  );
  
  ReturnButton = new Button1
  (
    580,600,120,70, 
    "assets/buttons/BackButton01.png", 
    "assets/buttons/BackButton02.png",
    leftImages, rightImages
  );
  
  MenuButton = new Button1
  (
    450,400,150,100, 
    "assets/buttons/menuButton01.png", 
    "assets/buttons/menuButton02.png",
    leftImages, rightImages
  );
  
  ReviverButton = new Button1
  (
    670,400, 150,100, 
    "assets/buttons/ReviveButton01.png", 
    "assets/buttons/ReviveButton02.png",
    leftImages, rightImages
  );
  
   
  //autores
  nome1 = new Nome("Joao Pedro Saldanha Felix", color(255, 0, 0));
  ra1 = new RA("004202003700", color(255, 0, 0));
  nome2 = new Nome("Rodrigo Henrique Menegatti Sacco ", color(247, 140, 0));
  ra2 = new RA("004202002011", color(247, 140, 0));
  nome3 = new Nome("Guilherme Xavier", color(16, 12, 240));
  ra3 = new RA("004202004891", color(16, 12, 240));
  
  //imagens
  bg = loadImage("assets/backgrounds/menuBackground.png");
  logo = loadImage("assets/letreiros/logoGame.png");
  gameOverLogo = loadImage("assets/letreiros/letreiroGameOver.png");
  bgGame = loadImage("assets/backgrounds/Mapa.png");
  bgModal = loadImage("assets/backgrounds/bgModal.png");

  
  //fontes
  font1= createFont("fonts/blasphemous.ttf", 48);

  //sons
  sound = new SoundFile(this, "sounds/menuMusic.mp3");
  HealthLoss = new SoundFile(this, "sounds/sxf_Healthloss.mp3");
  enemyHit = new SoundFile(this, "sounds/sfx_enemyHit.mp3");
  arrow = new SoundFile(this, "sounds/sfx_arrow.mp3");
  magic = new SoundFile(this, "sounds/sfx_projectile_magic.mp3");
  skull = new SoundFile(this, "sounds/sfx_proj_Nec.mp3");
  towerMusic = new SoundFile(this, "sounds/bgm_tower.mp3");
  
  
  //telas
  menuScreen = new MenuScreen();
  rulesScreen = new RulesScreen();
  gameScreen = new GameScreen();
  gameScreen2 = new GameScreen2();
  gameOverScreen = new GameOverScreen();
  selectPlayerScreen = new SelectPlayerScreen();
  historyScreen = new HistoryScreen();
}


void draw() 
{
  background(184);
  switch(menu)
    {
      case 0: //main menu
        {
          
         menuScreen.display();
         
         
        }break; 
      case 1: //regras
        {
         rulesScreen.display();
        }break;  
      case 2: //seleção de personagem para inicar o jogo
        {
        
        selectPlayerScreen.display();
        }break;
      case 3: //Fim do jogo
        {
          gameOverScreen.display();
        }break; 
        case 4: //historia
        {
          historyScreen.display();
        }break; 
        case 5: //Mago
        {
          gameScreen.display();
        }break; 
        case 6: //Arqueiro
        {
          gameScreen2.display();
        }break; 
    }
}

void keyPressed() {
  // ... Lógica de tecla pressionada ...
  if (menu == 5) {
    gameScreen.keyPressed();
  }
  if (menu == 6) {
    gameScreen2.keyPressed();
  }
}

void keyReleased() {
  // ... Lógica de tecla liberada ...
  if (menu == 5) {
    gameScreen.keyReleased();
  }
  if (menu == 6) {
    gameScreen2.keyReleased();
  }
}
