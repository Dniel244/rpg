class Button extends GameObject {
  color normal, highlight;
  boolean clicked;
  int w, h;
  
  
  Button(int x_, int y_, int w_, int h_, color normal_, color highlight_) {
    loc = new PVector(x_, y_);
    w = w_;
    h = h_;

    normal = normal_;
    highlight = highlight_;    
  }
  
  void show() {
    stroke(lightGrey);
    if (mouseX > loc.x - w/2 && mouseX < loc.x + w/2 && mouseY > loc.y - h/2 && mouseY < loc.y + h/2) {
      fill(highlight, 75);
    } else {
      fill(normal, 75);
    }
    
    rectMode(CENTER);
    rect(loc.x, loc.y, w, h);
    
    clicked = mouseReleased && mouseX > loc.x - w/2 && mouseX < loc.x + w/2 && mouseY > loc.y - h/2 && mouseY < loc.y + h/2;
  }
}
