class Bullet extends GameObject {
  color bulletColor;
  int timer;
  //bullet construcor
  Bullet(PVector vel_, color c, int s) {
    hp = 1;
    timer = 60;
    loc = hero.loc.copy();
    vel = vel_;
    size = s;
    bulletColor = c;
    roomX = hero.roomX;
    roomY = hero.roomY;
  }

  //how bullets appear
  void show() {
    noStroke();
    fill(bulletColor);
    circle(loc.x, loc.y, size);
  }


  void act() {
    super.act();
    //deleting bulelts if they dont find their target
    timer--;
    if (timer == 0) {
      hp = 0;
    }

    if (loc.x >= 725) {
      hp--;
    }

    if (loc.x <= 75) {
      hp--;
    }

    if (loc.y >= 725) {
      hp--;
    }

    if (loc.y <= 75) {
      hp--;
    }
  }
}
