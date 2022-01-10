class c6Button extends GameObject {
  color normal, highlight;
  boolean clicked;
  int w, h;
  int t;
  String text;
  PImage pI;


  c6Button(int x_, int y_, int w_, int h_, color normal_, color highlight_, int t_, String text_, color c_, PImage pI_) {
    loc = new PVector(x_, y_);
    w = w_;
    h = h_;
    t = t_;
    text = text_;
    c = c_;
    pI = pI_;

    normal = normal_;
    highlight = highlight_;
  }

  void show() {


    fill(c);
    if (n == true) {
      stroke(highlight);
    } else {


      if (mouseX > loc.x - w/2 && mouseX < loc.x + w/2 && mouseY > loc.y - h/2 && mouseY < loc.y + h/2) {
        stroke(highlight);
      } else {
        stroke(normal);
      }
    }



    rectMode(CENTER);
    ellipse(loc.x, loc.y, w, h);
    image(pI, loc.x-10, loc.y+5, 40, 40);
    image(pI, loc.x+15, loc.y+5, 40, 40);
    image(pI, loc.x, loc.y-15, 40, 40);

    fill(black);
    textAlign(CENTER, CENTER);
    textSize(50);
    text(text, loc.x, loc.y);

    clicked = mouseReleased && mouseX > loc.x - w/2 && mouseX < loc.x + w/2 && mouseY > loc.y - h/2 && mouseY < loc.y + h/2;
  }
}
