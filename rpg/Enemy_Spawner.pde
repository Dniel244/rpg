class Spawner extends Enemy {
  int spawnTimer = 150;
  int spawnThreshold = 150;
  Spawner(int x, int y) {
    super(50, 100, x, y);
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(purple);
    circle(loc.x, loc.y, size);
    fill(black);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    spawnTimer++;
    super.act();
    vel = new PVector(0, 0);
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);

      if (myObj.roomX == hero.roomX && myObj.roomY == hero.roomY) {
        if (spawnTimer >= spawnThreshold) {
          myObjects.add(new Follower(myObj.roomX, myObj.roomY));
          spawnTimer = 0;
        }
      }
      i++;
    }
  }
}
