class GameOverScreen {
  void display() {
    background(bg);
    
    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    image(gameOverLogo, 450, 100);
    
    
    //botão para iniciar jogo
    MenuButton.update();
    MenuButton.render();
    if(MenuButton.isClicked())
    {
      menu = 0;
    }
    
    ReviverButton.update();
    ReviverButton.render();
    if(ReviverButton.isClicked())
    {
      menu = 2;
    }
  }
}
