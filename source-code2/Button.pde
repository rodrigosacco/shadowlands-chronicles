class Button {
  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  Boolean Pressed = false;
  Boolean Clicked = false;
  PImage Image;
  PImage HoverImage;
  boolean hover = false;
  
  Button(int x, int y, int w, int h, String imagePath, String hoverImagePath ) {
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Image = loadImage(imagePath);
    HoverImage = loadImage(hoverImagePath);
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
    hover = isMouseOver();
  }
  
  void render() {
    if (hover) {
      image(HoverImage, Pos.x, Pos.y, Width, Height);
    } else {
      image(Image, Pos.x, Pos.y, Width, Height);
    }
    
    textAlign(CENTER, CENTER);
    textSize(18);
    fill(0);
    
  }
  
  boolean isClicked() {
    return Clicked;
  }
  
  boolean isMouseOver() {
    return mouseX >= Pos.x && mouseX <= Pos.x + Width && mouseY >= Pos.y && mouseY <= Pos.y + Height;
  }
  
}
