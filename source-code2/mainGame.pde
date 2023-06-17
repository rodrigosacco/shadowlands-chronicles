class GameScreen {
  
Player p1;
Enemy e1;
Enemy e2;
int tempoRestante = 300;
int intervaloSpawn = 2;
int quantidadeInimigos = 5;
float distanciaSpawn = 500;
ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;
//SoundFile HealthLoss;
//SoundFile enemyHit;
//SoundFile towerMusic;
//SoundFile arrow;
//SoundFile magic;
//SoundFile skull;

  GameScreen() {
    //initialize my vars
  p1 = new Player(width/2, height/2, 40, 50);

  
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  

  
  //HealthLoss = new SoundFile(this, "sounds/sxf_Healthloss.mp3");
  //enemyHit = new SoundFile(this, "sounds/sfx_enemyHit.mp3");
  //arrow = new SoundFile(this, "sounds/sfx_arrow.mp3");
  //magic = new SoundFile(this, "sounds/sfx_projectile_magic.mp3");
  //skull = new SoundFile(this, "sounds/sfx_proj_Nec.mp3");
  //towerMusic = new SoundFile(this, "sounds/bgm_tower.mp3");
  
  
  }

  void resetGame() {
      tempoRestante = 300;
      quantidadeInimigos = 5;
      bulletList.clear();
      enemyList.clear();
      p1.vida = 20;
      // Reinicialize outros valores conforme necessário
      p1 = new Player(width/2, height/2, 40, 50);
    }

  void display() {
    background(bgGame);
    
  fill(255,0,0); 
  textAlign(CENTER, TOP); 
  text("Tempo Restante: " + tempoRestante, width/2, 10); // Exibe o valor de tempoRestante na posição desejada
 
  p1.move();
  p1.render();
  
  if (frameCount % 60 == 0 && tempoRestante > 0) {
    tempoRestante--;
    
    if(tempoRestante % intervaloSpawn == 0){
      quantidadeInimigos++;
    }
  }
  
  if(tempoRestante > 0 && frameCount % 60 == 0 && tempoRestante % intervaloSpawn == 0){
    for (int i = 0; i < quantidadeInimigos; i++){
      float startingX, startingY;
      int startingW = 30;
      int startingH = 40;
      do{
      float offsetX = random(-distanciaSpawn, distanciaSpawn);
      float offsetY = random(-distanciaSpawn, distanciaSpawn);
      startingX = p1.x + offsetX;
      startingY = p1.y + offsetY;
      
      } while (dist(startingX, startingY, p1.x, p1.y) < distanciaSpawn/2);
      
      enemyList.add(new Enemy(startingX, startingY, startingW, startingH));
    }
  }
  
  if(p1.vida <= 0){
   resetGame(); 
  }
  
  for (Enemy anEnemy : enemyList){
    anEnemy.update(p1);
    anEnemy.render();
    p1.checkCollision(anEnemy);
    
  }
  
  // for loop tha goes through all bullets
  for (Bullet aBullet : bulletList){
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
    
     for (Enemy anEnemy : enemyList){
      aBullet.shootEnemy(anEnemy); 
     }
  }
  //for loop that removes unwanted bullets
  for (int i = bulletList.size() - 1; i >= 0; i = i - 1) {
    Bullet aBullet = bulletList.get(i);
    
    if (aBullet.shouldRemove == true){
      bulletList.remove (aBullet);
    }
  }
   //for loop that removes killed enemies
   for (int i = enemyList.size() - 1; i >= 0; i = i - 1) {
    Enemy anEnemy = enemyList.get(i);
    
    if (anEnemy.shouldRemove == true){
      enemyList.remove (anEnemy);
    }
  }
  
  p1.updateLife();
}

void keyPressed() {
  if (keyCode == LEFT) {
    p1.isMovingLeft = true;
  }
  if (keyCode == RIGHT) {
    p1.isMovingRight = true;
  }
    if (keyCode == UP) {
    p1.isMovingUp = true;
  }
    if (keyCode == DOWN) {
    p1.isMovingDown = true;
  }
  if (keyCode == ' '){
   arrow.play();
   int bulletX = p1.x;
   int bulletY = p1.y;
   p1.shootStand = true;
   
  if (p1.hasMoved) {
      bulletX += p1.lastDirectionX * (p1.w / 2 + 10);
      bulletY += p1.lastDirectionY * (p1.h / 2 + 10);
    }
    int bulletDirX = p1.lastDirectionX;
    int bulletDirY = p1.lastDirectionY;

    bulletList.add(new Bullet(bulletX, bulletY, bulletDirX, bulletDirY));
  }  
}

void keyReleased() {
  if (keyCode == LEFT) {
    p1.isMovingLeft = false;
  }
  if (keyCode == RIGHT) {
    p1.isMovingRight = false;
  }
      if (keyCode == UP) {
    p1.isMovingUp = false;
  }
    if (keyCode == DOWN) {
    p1.isMovingDown = false;
  }
}
}
