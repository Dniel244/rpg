class Follower extends Enemy {
  Follower(int x, int y) {
    super(100, 50, x, y);
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(lightBlue);
    circle(loc.x, loc.y, size);
    fill(black);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act(); 


    vel = new PVector(hero.loc.x - loc.x, hero.loc.y - loc.y);
    vel.setMag(3);
  }
}
