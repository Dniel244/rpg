class Bullet extends GameObject {

  int timer;
  int l;
  int c;
  int s;
  //bullet construcor
  Bullet(int l_, int c_, int s_) {
    timer = 60;
    hp = 1;
    loc = new PVector(l, l);
    vel = new PVector(5, 5);
    size = 10;
    //how far bullets travel
    vel.setMag(10);
    l = l_;
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
  }
}
