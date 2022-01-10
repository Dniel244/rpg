class Shop extends GameObject {
  int t = 255;
  Shop() {
    hp = 1;
    loc = new PVector(width/2, 150);
    vel = new PVector(0, 0);
    c = green;
  }
  
  void show() {
    rectMode(CENTER);
    stroke(black);
    strokeWeight(1);
    fill(c, t);
    rect(loc.x, loc.y, 200, 50);
    
  }
  
  void act() {
  }
}
