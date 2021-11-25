class Hero extends GameObject {
  float speed;
  AnimatedGif currentAction;
  int itimer, ithreshold;
  int ht;
  Weapon weapon;
  Hero() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 50;
    hp = 100;
    ht = 100;
    speed = 5;
    roomX = 1;
    roomY = 1;
    roomx = roomX;
    roomy = roomY;
    itimer = 0;
    ithreshold = 50;
    weapon = new AutoPistol();
    currentAction = manDown;
  }



  void show() {
    currentAction.show(loc.x, loc.y, size/1.5, size);
  }

  void act() {
    super.act();

    itimer++;

    if (itimer >= ithreshold) {

      ht = 200;


      int i = 0;
      while (i < myObjects.size()) {
        GameObject myObj = myObjects.get(i);        
        if (isCollidingWith(myObj) &&  myObj instanceof TBullet) {
          hp= hp - 5;
          itimer = 0;
          ht = 100;
        }
        if (isCollidingWith(myObj) && myObj instanceof Enemy) {
          hp= hp - 5;
          itimer = 0;
          ht = 100;
        }

        if (isCollidingWith(myObj) && myObj instanceof DroppedItem) {
          DroppedItem item = (DroppedItem) myObj;
          if (item.type == GUN) {
            weapon = item.w;
            item.hp = 0;
          }
        }
        i++;
      }
    }


    if (abs(vel.y) > abs(vel.x)) {
      if (vel.y > 0) currentAction = manDown;
      else currentAction = manUp;
    } else {
      if (vel.x > 0) currentAction = manRight;
      else currentAction = manLeft;
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
