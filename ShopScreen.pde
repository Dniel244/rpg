void pause() {


  background(darkdarkGrey);
  fill(white);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("YOU HAVE " + hero.xp + " XP", width/2, 100);
  text("MAX HP: " + hero.hpMax, 440, 200);
  text("SPEED: " + hero.speed, 380, 300);
  text("DAMAGE: " + hero.damage, 430, 400);
  healthUp.show();
  speedUp.show();
  damageUp.show();
  exit.show();
  click();

  if (hero.xp > 0) {
    if (healthUp.clicked) {
      hero.hpMax = hero.hpMax + 10;
      hero.xp--;
    }
    
    

    if (speedUp.clicked) {
      hero.speed = hero.speed + 1;
      hero.xp--;
    }

    if (damageUp.clicked) {
      hero.damage = hero.damage + 5;
      hero.xp--;
    }

    //if (speedUp.clicked)
    //if (damageUp.clicked)
  }
  if (exit.clicked) mode = GAME;
}

void Buttons() {
}

void pauseClicks() {
}
