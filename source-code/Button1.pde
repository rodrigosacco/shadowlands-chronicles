class Button1 {
  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  boolean Pressed = false;
  boolean Clicked = false;
  PImage Image;
  PImage HoverImage;
  PImage[] leftImages;
  PImage[] rightImages;
  int leftIndex = 0; // Índice da imagem esquerda atual
  int rightIndex = 0; // Índice da imagem direita atual
  float imageSwapTime = 0.1; // Tempo entre as trocas de imagem (em segundos)
  float lastSwapTime = 0; // Tempo da última troca de imagem
  boolean enableImageSwap = true; // Variável para controlar a troca de imagem

  Button1(int x, int y, int w, int h, String imagePath, String hoverImagePath, PImage[] leftImages, PImage[] rightImages) {
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Image = loadImage(imagePath);
    HoverImage = loadImage(hoverImagePath);
    this.leftImages = leftImages;
    this.rightImages = rightImages;
  }

  void update() {
    if (mousePressed && mouseButton == LEFT && !Pressed) {
      Pressed = true;
      if (isMouseOver()) {
        Clicked = true;
      }
    } else {
      Clicked = false;
      Pressed = false;
    }
  }

  void render() {
    boolean hover = isMouseOver();
    if (hover) {
      image(HoverImage, Pos.x, Pos.y, Width, Height);
    } else {
      image(Image, Pos.x, Pos.y, Width, Height);
    }


    if (hover) {
      displayImages();
    }
  }

  boolean isClicked() {
    return Clicked;
  }

  boolean isMouseOver() {
    return mouseX >= Pos.x && mouseX <= Pos.x + Width && mouseY >= Pos.y && mouseY <= Pos.y + Height;
  }

  void displayImages() {
    if (millis() - lastSwapTime > imageSwapTime * 1000 && enableImageSwap) {
      leftIndex = (leftIndex + 1) % leftImages.length; // Alterna para a próxima imagem esquerda
      rightIndex = (rightIndex + 1) % rightImages.length; // Alterna para a próxima imagem direita
      lastSwapTime = millis(); // Atualiza o tempo da última troca de imagem
    }

    image(leftImages[leftIndex], Pos.x - leftImages[leftIndex].width, Pos.y + 24);
    image(rightImages[rightIndex], Pos.x + Width, Pos.y + 24);
  }
}
