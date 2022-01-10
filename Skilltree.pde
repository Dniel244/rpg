class Skilltree extends GameObject {
  
  Skilltree() {
    hp = 1;
    loc = new PVector(width-250, 150);
    vel = new PVector(0, 0);
    c = purple;  
  }
  
  void show() {
    fill(c);
    stroke(black);
    strokeWeight(1);
    circle(loc.x, loc.y, 50);
  }
}
