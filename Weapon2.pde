class SniperRifle extends Weapon {

  SniperRifle() {
    super(SNIPER_RIFLE_THRESHOLD, SNIPER_RIFLE_BULLETSPEED);
  }
}

class AutoPistol extends Weapon {

  AutoPistol() {
    super(AUTO_PISTOL_THRESHOLD, AUTO_PISTOL_BULLETSPEED);
  }
}

class ShotGun extends Weapon {
  ShotGun() {
    super(SHOTGUN_THRESHOLD, SHOTGUN_BULLETSPEED);
  }


  void update() {
    shotTimer++;
  }

  void shoot() {
    if (ammo > 0) {
      if (shotTimer >= threshold) {
        ammo = ammo - 5;
        int i = 0;
        while  (i < 30) {
          PVector aimVector = new PVector (mouseX-hero.loc.x, mouseY-hero.loc.y) ;
          aimVector.rotate((random(-PI, PI)));
          aimVector.setMag(bulletSpeed);
          myObjects.add(new Bullet(aimVector, red, 10));
          shotTimer = 0;
          i++;
        }
      }
    }
  }
}
