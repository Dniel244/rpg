boolean sDmg = false;
float shieldC = 100;
float shieldCThreshold = 100;
float shieldpC = 100;
float shieldpCThreshold = 100;
boolean exShield = false;
class Shield extends GameObject {

  Shield() {
    hp = 1;
    loc = new PVector(width/2, width/2);
    vel = new PVector(0, 0);
  }

  void show() {

    image(iHshield, hero.loc.x, hero.loc.y, 100, 100);
    noFill();
    noStroke();
    rectMode(CENTER);
    rect(hero.loc.x, hero.loc.y, 100, 100);
  }

  void act() {
    super.act();
    loc = hero.loc.copy();
    vel = hero.vel.copy();
  }
}
