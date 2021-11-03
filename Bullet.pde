class Bullet extends GameObject {

  int timer;
  int l;
  int c;
  int s;
  //bullet construcor
  Bullet(PVector l_, int c_, int s_) {
    timer = 60;
    hp = 1;
    loc = hero.loc.copy();
    vel = l_;
    size = 10;
    //how far bullets travel
    vel.setMag(10);
    c = c_;
    s = s_;
  }

  //how bullets appear
  void show() {
    stroke(c);
    fill(c);
    ellipse(loc.x, loc.y, s, s);
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
