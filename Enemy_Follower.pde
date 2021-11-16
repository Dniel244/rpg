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

    

    if (dist(hero.loc.x, hero.loc.y, loc.x, loc.y) < width/2-100) {
      vel = new PVector(hero.loc.x - loc.x, hero.loc.y - loc.y);
    } else {
      vel = new PVector(width/2 - loc.x, height/2 - loc.y);
    }

    vel.setMag(3);
  }
}
