class SniperRifle extends Weapon {

  SniperRifle() {
    super(100, 20);
  }
}

class AutoPistol extends Weapon {

  AutoPistol() {
    super(10, 5);
  }
}

class ShotGun extends Weapon {
  ShotGun() {
    super(100, 5);
  }

  void shoot() {
    if (shotTimer >= threshold) {
      int i = 0;
      while  (i < 30) {
        PVector aimVector = new PVector (mouseX-hero.loc.x, mouseY-hero.loc.y) ;
        aimVector.rotate((random(-PI, PI)));
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, red, 10));
        i++;
      }
      shotTimer = 0;
    }
  }
}
