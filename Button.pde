class Button extends GameObject {
  color normal, highlight;
  boolean clicked;
  int w, h;
  int t;
  String text;


  Button(int x_, int y_, int w_, int h_, color normal_, color highlight_, int t_, String text_) {
    loc = new PVector(x_, y_);
    w = w_;
    h = h_;
    t = t_;
    text = text_;

    normal = normal_;
    highlight = highlight_;
  }

  void show() {
    stroke(lightGrey);
    if (mouseX > loc.x - w/2 && mouseX < loc.x + w/2 && mouseY > loc.y - h/2 && mouseY < loc.y + h/2) {
      fill(highlight, t);
    } else {
      fill(normal, t);
    }
  
    rectMode(CENTER);
    rect(loc.x, loc.y, w, h);
    
    fill(black);
    textAlign(CENTER, CENTER);
    textSize(50);
    text(text, loc.x, loc.y);

    clicked = mouseReleased && mouseX > loc.x - w/2 && mouseX < loc.x + w/2 && mouseY > loc.y - h/2 && mouseY < loc.y + h/2;
  }
}
