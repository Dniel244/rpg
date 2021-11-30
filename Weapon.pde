class Weapon {
  int shotTimer;
  int threshold;
  int bulletSpeed;  
  int d;


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
      myObjects.add(new Bullet(aimVector, red, 10));
      shotTimer = 0;
    }
  }
}
