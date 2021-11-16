class Hero extends GameObject {
  float speed;
  int itimer, ithreshold;
  int ht;
  Weapon weapon;
  Hero() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 50;
    hp = 3;
    ht = 100;
    speed = 5;
    roomX = 1;
    roomY = 1;
    roomx = roomX;
    roomy = roomY;
    itimer = 0;
    ithreshold = 180;
    weapon = new ShotGun();
  }

  void show() {
    fill(blue, ht);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();

    itimer++;

    if (itimer >= ithreshold) {

      ht = 200;

      //ship collisions
      int i = 0;
      while (i < myObjects.size()) {
        GameObject myObj = myObjects.get(i);

        if (myObj.roomX == hero.roomX && myObj.roomY == hero.roomY) {
          if (myObj instanceof Enemy) {
            if ( dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) < size/2 + myObj.size) {
              hp--;
              itimer = 0;
              ht = 100;
            }
          }
        }
        i++;
      }
    }





    roomx = roomX;
    roomy = roomY;
    if (up) vel.y = -speed;
    if (down)  vel.y = speed;
    if (left) vel.x = -speed;
    if (right) vel.x = speed;

    if (vel.mag() > 5) vel.setMag(5);

    if (!up && !down) vel.y = 0;
    if (!left && !right) vel.x = 0;

    //check exits
    if (northRoom != #FFFFFF && loc.y == 75 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY--;
      loc = new PVector(width/2, 725);
    } else if (eastRoom != #FFFFFF && loc.y >= height/2-50 && loc.y <= height/2+50 && loc.x == 725) {
      roomX++;
      loc = new PVector(75, height/2);
    } else if (southRoom != #FFFFFF && loc.y == 725 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY++;
      loc = new PVector(width/2, 75);
    } else if (westRoom != #FFFFFF && loc.y >= height/2-50 && loc.y <= height/2+50 && loc.x == 75) {
      roomX--;
      loc = new PVector(725, height/2);
    }

    weapon.update();
    if (spacekey) {
      weapon.shoot();
    }
  }
}
