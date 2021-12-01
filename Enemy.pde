class Enemy extends GameObject {

  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
    xp = 1;
  }

  Enemy(int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    roomX = x;
    roomY = y;
    size = 50;
  }

  Enemy(int _hp, int s, int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = _hp;
    roomX = x;
    roomY = y;
    size = s;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(green);
    circle(loc.x, loc.y, size);
    fill(black);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    int etr, utr;
    int et = 0;
    Weapon ut = new AutoPistol();
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {
        hp = hp - ((Bullet) obj).damage;
        obj.hp = 0;
        if (hp <= 0 ) {

          etr = int(random(0, 2));
          if (etr == 0) et = GUN;
          if (etr == 1) et = HEALTH;

          utr = int(random(0, 3));
          if (utr == 0) ut = new ShotGun();
          if (utr == 1) ut = new AutoPistol();
          if (utr == 2) ut = new SniperRifle();




          myObjects.add (new DroppedItem(loc.x, loc.y, roomX, roomY, et, ut));

          hero.xp += xp;
          myObjects.add(new Message(loc, "+"+xp, hero.roomX, hero.roomY));
        }
      }
      i++;
    }
  }
}
