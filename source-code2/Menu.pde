class MenuScreen {
  void display() {
    background(bg);
    
          
    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    image(logo, 260, 100);

    
    //botão para iniciar jogo
    StartButton.update();
    StartButton.render();
    if(StartButton.isClicked())
    {
      towerMusic.loop();
      menu = 2;
    }
    
    // Botão para aba de Regras
    RulesButton.update();
    RulesButton.render();
    if(RulesButton.isClicked())
    {
      menu = 1;
    }
    
    HistoryButton.update();
    HistoryButton.render();
    if(HistoryButton.isClicked()) 
    {
      menu = 4;
    }
    
    // Botão para aba de autores
    AuthorButton.update();
    AuthorButton.render();
    if(AuthorButton.isClicked())
    {
      showModal = true;
    }  
    if (showModal) {
      // Desenha o fundo escurecido
      fill(0, 150); // Ajuste a opacidade do fundo aqui
      rect(0, 0, width, height);
      
      // Desenha o modal
      fill(97);
      rect(380, 100, width - 800, height - 200);
      
      // Desenha o conteúdo do modal
      textSize(30);
      fill(0);
      text("Autores", 620, 200);
      textFont(font1);
      nome1.exibir(620, 350);
      ra1.exibir(620, 380);
      nome2.exibir(620, 440);
      ra2.exibir(620, 470);
      nome3.exibir(620, 520);
      ra3.exibir(620, 550);
   
      close = new Button
      (
        width - 490, 110, 50, 50, "assets/buttons/CloseButton01.png", "assets/buttons/CloseButton02.png"); // Botão close no canto superior direito
        close.update();
        close.render();
        
        if (close.isClicked()) {
          showModal = false;
        }
      }
  }
}
