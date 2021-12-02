void pause() {


  background(darkdarkGrey);
  fill(white);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("YOU HAVE " + hero.xp + " XP", width/2, 100);
  text("HP: " + hero.hpMax, 357, 200);
  text("SPEED: " + hero.speed, 380, 300);
  text("DAMAGE: " + hero.damage, 430, 400);
  healthUp.show();
  speedUp.show();
  damageUp.show();
  exit.show();
  click();

  if (hero.xp > 0) {
    if (healthUp.clicked) {
      hero.hpMax++;
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
