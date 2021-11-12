class Enemy extends GameObject {

  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(green);
    circle(loc.x, loc.y, 50);
    fill(black);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(hp, loc.x, loc.y);
  }
}
