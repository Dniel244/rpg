class TBullet extends GameObject {
  color bulletColor;
  int damage;
  //bullet construcor
  TBullet(PVector vel_, color c, int s) {

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Turret) {
        hp = 1;
        damage = 5;
        loc = myObj.loc.copy();
        vel = vel_;
        size = s;
        bulletColor = c;





        roomX = myObj.roomX;
        roomY = myObj.roomY;
      }
    }
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
