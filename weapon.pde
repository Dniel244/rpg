class Weapon {
  int shotTimer;
  int threshold;
  int bulletSpeed;   

  Weapon() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
  }

  Weapon(int thr, int bs) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = bs;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-hero.loc.x, mouseY-hero.loc.y);
      aimVector.setMag(bulletSpeed);
     // myObjects.add(new Bullet(aimVector, lightBlue, 10));
    }
  }
}
