class Player {

  //variables
  PImage[] lifeSprites = new PImage[11];
  PImage[] playerWalk = new PImage[3];
  PImage[] playerWalkL = new PImage[3];

 
  String playerSelected = "Mage";
  
  
  
  PImage playerStand = loadImage("./" + playerSelected + "/" + playerSelected + "Stand.png");
  
  int x;
  int y;
  int w;
  int h;
  
  int vida;
  boolean isInvincible = false;
  float invincibleTimer;
  int currentFrame = 0;
  int frameInterval = 1000;
  int frameIntervalMove = 100; // Duração da animação em milissegundos
  int lastFrameTime = 0;
  int frameCounter = 0;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingUp;
  boolean isMovingDown;
  boolean hasMoved;
  boolean shootStand;
 
  int lastDirectionX;
  int lastDirectionY;
  int speed;

  int left; 
  int right;
  int top;
  int bottom;
  
  int spriteIndex = 10;
  
  //constructor
  Player(int startingX, int startingY, int startingW, int startingH) {
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    vida = 20;
    
    isMovingLeft = false;
    isMovingRight = false;
    isMovingUp = false;
    isMovingDown = false;
    hasMoved = false;
    lastDirectionX = 0;
    lastDirectionY = -1; // Inicialmente, aponta para cima
    
    speed = 10;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
  
  //functions
  void render(){
    if(isInvincible == true){
      if(frameCounter < frameInterval / 2){
        image(playerStand,x, y, w, h);
      }
      
      frameCounter++;
      
      if (frameCounter >= frameInterval) {
        frameCounter = 0;
      }
    } else if(hasMoved != true){
      image(playerStand,x, y, w, h);
    } 
  }

  void move() {
    
    playerWalk[0] = loadImage("./" + playerSelected + "/" + playerSelected + "Walk1.png");
    playerWalk[1] = loadImage("./" + playerSelected + "/" + playerSelected + "Walk2.png");
    playerWalk[2] = loadImage("./" + playerSelected + "/" + playerSelected + "Walk3.png");
    
    playerWalkL[0] = loadImage("./" + playerSelected + "/" + playerSelected + "Walk1L.png");
    playerWalkL[1] = loadImage("./" + playerSelected + "/" + playerSelected + "Walk2L.png");
    playerWalkL[2] = loadImage("./" + playerSelected + "/" + playerSelected + "Walk3L.png");
    
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    if (isMovingLeft == true) {
      x -= speed; //x = x - speed;
      lastDirectionX = -1;
      lastDirectionY = 0;
      hasMoved = true;
      image(playerWalkL[currentFrame], x, y, w, h);
    }

    if (isMovingRight == true) {
      x += speed; //x = x + speed;
      lastDirectionX = 1;
      lastDirectionY = 0;
      hasMoved = true;
      image(playerWalk[currentFrame], x, y, w, h);
    }

    if (isMovingUp == true) {
      y -= speed;
      lastDirectionX = 0;
      lastDirectionY = -1;
      hasMoved = true;
      image(playerWalk[currentFrame], x, y, w, h);
    }

    if (isMovingDown == true) {
      y += speed;
      lastDirectionX = 0;
      lastDirectionY = 1;
      hasMoved = true;
      image(playerWalk[currentFrame], x, y, w, h);
    }
    
    if (isMovingLeft != true && isMovingRight != true && isMovingUp != true && isMovingDown != true){
      hasMoved = false;
    }
    
    
    if (millis() - lastFrameTime >= frameIntervalMove) {
      currentFrame++;
      if (currentFrame >= playerWalk.length) {
        currentFrame = 0;
      }

      lastFrameTime = millis();
    }
  }

  void checkCollision(Enemy anEnemy) {
    if (top <= anEnemy.bottom &&
        bottom >= anEnemy.top &&
        left <= anEnemy.right &&
        right >= anEnemy.left && !isInvincible){
        vida -= 2;
        HealthLoss.play();
        isInvincible = true;
        invincibleTimer = millis() + 1500;
        spriteIndex--;
     }
     
     if (isInvincible && millis() >= invincibleTimer) {
       isInvincible = false; 
     }
     
     if (vida <= 0) {
      // Game Over - Tratar a situação de fim do jogo
      menu = 3;
      spriteIndex = 10;
    }
  }
  
  void updateLife(){
    lifeSprites[0] = loadImage("./assets/lifeSprite/lifeState10.png");
    lifeSprites[1] = loadImage("./assets/lifeSprite/lifeState09.png");
    lifeSprites[2] = loadImage("./assets/lifeSprite/lifeState08.png");
    lifeSprites[3] = loadImage("./assets/lifeSprite/lifeState07.png");
    lifeSprites[4] = loadImage("./assets/lifeSprite/lifeState06.png");
    lifeSprites[5] = loadImage("./assets/lifeSprite/lifeState05.png");
    lifeSprites[6] = loadImage("./assets/lifeSprite/lifeState04.png");
    lifeSprites[7] = loadImage("./assets/lifeSprite/lifeState03.png");
    lifeSprites[8] = loadImage("./assets/lifeSprite/lifeState02.png");
    lifeSprites[9] = loadImage("./assets/lifeSprite/lifeState01.png");
    lifeSprites[10] = loadImage("./assets/lifeSprite/lifeState00.png");
    
    
    image(lifeSprites[spriteIndex], 25, 25);
  }
}
