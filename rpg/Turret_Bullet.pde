class TBullet extends GameObject {
  int damage;
  int TBulletColor;
  //bullet construcor
  TBullet(PVector vel_, color c, int s, PVector location) {
    loc = location.copy();
    hp = 1;
    damage = 5;
    vel = vel_;
    size = s;
    TBulletColor = c;
    roomX = hero.roomX;
    roomY = hero.roomY;
  }

  //how bullets appear
  void show() {
    noStroke();
    fill(TBulletColor);
    circle(loc.x, loc.y, size);
  }


  void act() {
    super.act();
    //deleting bulelts if they dont find their target


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


    if (roomX != hero.roomX || roomY != hero.roomY) {
      hp--;
    }
  }
}
