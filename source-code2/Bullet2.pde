class Bullet2 {
 
  //variables
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
  
  // constructor
  Bullet2(int startingX, int startingY, int directionX, int directionY){
    x = startingX;
    y = startingY;
    
    dirX = directionX;
    dirY = directionY;
    
    d = 30;
    
    speed = 15;
    
    shouldRemove = false;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
    
    imgRight = loadImage("./Archer/Arrow/arrow_projR.png");
    imgLeft = loadImage("./Archer/Arrow/arrow_projL.png");
    imgUp = loadImage("./Archer/Arrow/arrow_projU.png");
    imgDown = loadImage("./Archer/Arrow/arrow_projD.png");
  }
  
  void render(){
    PImage img = null;
    
    if(dirX > 0) {
      img = imgRight;
    }
    if(dirX < 0) {
      img = imgLeft;
    }
    if(dirY > 0) {
      img = imgDown;
    }
    if(dirY < 0) {
      img = imgUp;
    }
    
    image(img, x, y, img.width, img.height);
  }
  
  void move(){
    x += dirX * speed;
    y += dirY * speed;
   
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
    
  }
  
  void checkRemove(){
    if (y < 0 || y > 720 || x < 0 || x > 1280){
      shouldRemove = true;
    }
  }
  
  void shootEnemy(Enemy2 anEnemy){
    // if the bullet collides with the enemy
    // then flag the enemy to be removed
    if (top <= anEnemy.bottom &&
        bottom >= anEnemy.top &&
        left <= anEnemy.right &&
        right >= anEnemy.left){
        enemyHit.play();
        anEnemy.shouldRemove = true;
        shouldRemove = true;
        }
  }
}
