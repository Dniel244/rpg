int hpXpCost, spdXpCost, dmgXpCost;
void pause() {


  background(darkdarkGrey);
  fill(white);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("YOU HAVE " + hero.xp + " XP", width/2, 100);
  text("MAX HP: " + hero.hpMax + "   ( " + hpXpCost + "xp)", 440, 200);
  text("SPEED: " + hero.speed + "   ( " + spdXpCost + "xp)", 400, 300);
  text("DAMAGE: " + hero.damage + "   ( " + dmgXpCost + "xp)", 430, 400);
  healthUp.show();
  speedUp.show();
  damageUp.show();
  exit.show();
  click();

  if (hero.hpMax < 130) {
    hpXpCost = 1;
    if (hero.xp > 0) {
      if (hero.hpMax < 200) {
        if (healthUp.clicked) {
          hero.hpMax = hero.hpMax + 10;
          hero.xp--;
        }
      }
    }
  } else if (hero.hpMax >= 130 && hero.hpMax < 170) {
    hpXpCost = 2;
    if (hero.xp > 1) {
      if (hero.hpMax < 200) {
        if (healthUp.clicked) {
          hero.hpMax = hero.hpMax + 10;
          hero.xp = hero.xp - 2;
        }
      }
    }
  } else if (hero.hpMax >= 170 && hero.hpMax < 200) {
    hpXpCost = 5;
    if (hero.xp > 4) {
      if (hero.hpMax < 200) {
        if (healthUp.clicked) {
          hero.hpMax = hero.hpMax + 10;
          hero.xp = hero.xp - 5;
        }
      }
    }
  } else if (hero.hpMax == 200) {
    hpXpCost = 10;
    if (hero.xp > 9) {
      if (hero.hpMax < 200) {
        if (healthUp.clicked) {
          hero.hpMax = hero.hpMax + 10;
          hero.xp = hero.xp - 10;
        }
      }
    }
  }

  if (hero.speed < 4) {
    spdXpCost = 1;
    if (hero.xp > 0) {
      if (speedUp.clicked) {
        hero.speed = hero.speed + 0.5;
        hero.xp--;
      }
    }
  } else if (hero.speed >= 4 && hero.speed < 5) {
    spdXpCost = 5;
    if (hero.xp > 4) {
      if (speedUp.clicked) {
        hero.speed = hero.speed + 0.5;
        hero.xp = hero.xp - 5;
      }
    }
  } else if (hero.speed >= 5 && hero.speed < 6) {
    spdXpCost = 10;
    if (hero.xp > 9) {
      if (speedUp.clicked) {
        hero.speed = hero.speed + 0.5;
        hero.xp = hero.xp - 10;
      }
    }
  }

  if (hero.damage < 10) {
    dmgXpCost = 1;
    if (hero.xp > 0) {
      if (damageUp.clicked) {
        hero.damage = hero.damage + 5;
        hero.xp--;
      }
    }
  } else if (hero.damage >= 10 && hero.damage < 20 ) {
    dmgXpCost = 2;
    if (hero.xp > 1) {
      if (damageUp.clicked) {
        hero.damage = hero.damage + 5;
        hero.xp = hero.xp - 2;
      }
    }
  } else if (hero.damage >= 20 && hero.damage < 30 ) {
    dmgXpCost = 3;
    if (hero.xp > 2) {
      if (damageUp.clicked) {
        hero.damage = hero.damage + 5;
        hero.xp = hero.xp - 3;
      }
    }
  } else if (hero.damage >= 30 && hero.damage < 40 ) {
    dmgXpCost = 5;
    if (hero.xp > 4) {
      if (damageUp.clicked) {
        hero.damage = hero.damage + 5;
        hero.xp = hero.xp - 5;
      }
    }
  } else if (hero.damage >= 40 && hero.damage < 50 ) {
    dmgXpCost = 10;
    if (hero.xp > 9) {
      if (damageUp.clicked) {
        hero.damage = hero.damage + 5;
        hero.xp = hero.xp - 10;
      }
    }
  }

  //if (speedUp.clicked)
  //if (damageUp.clicked)

  if (exit.clicked) mode = GAME;
}

void Buttons() {
}

void pauseClicks() {
}
