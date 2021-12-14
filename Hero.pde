int itimer, ithreshold;
int ht;
class Hero extends GameObject {
  AnimatedGif currentAction;

  Weapon weapon;
  Hero() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 50;
    hpMax = hp = 100;
    ht = 100;
    speed = 3;
    roomX = 1;
    roomY = 1;
    roomx = roomX;
    roomy = roomY;
    itimer = 0;
    ithreshold = 50;
    weapon = new AutoPistol();
    currentAction = manDown;
    damage = 5;
  }



  void show() {
    currentAction.show(loc.x, loc.y, size/1.5, size);
    textSize(30);
    fill(black);
    textAlign(CENTER, CENTER);
    text(hp, loc.x, loc.y-50);
  }

  void act() {
    super.act();;
    if (hp > hpMax) {
      hp = hpMax;
    }


    itimer++;

    if (itimer >= ithreshold) {

      ht = 200;


      int i = 0;
      while (i < myObjects.size()) {
        GameObject myObj = myObjects.get(i);        
        if (isCollidingWith(myObj) &&  myObj instanceof TBullet) {
          hp= hp - 25;
          itimer = 0;
          ht = 100;
        }
        if (isCollidingWith(myObj) && myObj instanceof Enemy) {
          hp = hp - 10;
          itimer = 0;
          ht = 100;
        }

        if (myObj instanceof DroppedItem) {
          DroppedItem item = (DroppedItem) myObj;
          if (item.type == GUN) {
            item.ic = yellow;
          }

          if (item.type == HEALTH) {
            item.ic = pink;
          }
        }

        if (isCollidingWith(myObj) && myObj instanceof DroppedItem) {
          DroppedItem item = (DroppedItem) myObj;
          if (item.type == GUN) {
            weapon = item.w;
            item.hp = 0;
          } else if (item.type == HEALTH) {
            if (hp < hpMax) {
              hp = hp + 10;
              item.hp = 0;
            } else {
              item.hp = 0;
            }
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



    if (!up && !down) vel.y = 0;
    if (!left && !right) vel.x = 0;

    //check exits
    if (northRoom != #FFFFFF && loc.y == 75 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY--;
      loc = new PVector(width/2, 725);
      cleanUp();
    } else if (eastRoom != #FFFFFF && loc.y >= height/2-50 && loc.y <= height/2+50 && loc.x == 725) {
      roomX++;
      loc = new PVector(75, height/2);
      cleanUp();
    } else if (southRoom != #FFFFFF && loc.y == 725 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY++;
      loc = new PVector(width/2, 75);
      cleanUp();
    } else if (westRoom != #FFFFFF && loc.y >= height/2-50 && loc.y <= height/2+50 && loc.x == 75) {
      roomX--;
      loc = new PVector(725, height/2);
      cleanUp();
    }

    weapon.update();
    if (spacekey) {
      weapon.shoot();
    }
  }

  void cleanUp() {
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet || obj instanceof TBullet || obj instanceof Message) {
        if (!inRoomWith(obj)) {
          myObjects.remove(i);
          i--;
        }
      }

      i++;
    }
  }
}
