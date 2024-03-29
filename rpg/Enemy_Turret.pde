class Turret extends Enemy {
  int tbTimer;
  int tbThreshold;
  int tBulletSpeed = 5;
  Turret(int x, int y) {
    super(50, 100, x, y);
    tbTimer = 0;
    tbThreshold = 100;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(yellow);
    circle(loc.x, loc.y, size);
    fill(black);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    tbTimer++;
    super.act(); 
    PVector hAimvector = new PVector(hero.loc.x-loc.x, hero.loc.y-loc.y);
    println(tbTimer);
    vel = new PVector(0, 0);

    if (roomX == hero.roomX && roomY == hero.roomY) {

      if (tbTimer >= tbThreshold) {
        myObjects.add(new TBullet(hAimvector, purple, 10, loc));
        hAimvector.setMag(tBulletSpeed);
        tbTimer = 0;
      }
    }
  }
}
