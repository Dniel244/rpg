class Turret extends Enemy {
  int tbTimer = 100;
  Turret(int x, int y) {
    super(50, 100, x, y);
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
    PVector haimvector = new PVector(hero.loc.x-loc.x, hero.loc.y-loc.y);
    println(tbTimer);
    vel = new PVector(0, 0);
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);

      if (myObj.roomX == hero.roomX && myObj.roomY == hero.roomY) {
        if (tbTimer >= 100) {
          myObjects.add(new TBullet(haimvector, blue, 10));
          tbTimer = 0;
        }
      }
      i++;
    }
  }
}
