void pause() {
  background(darkdarkGrey);
  fill(white);
  textSize(50);
  text("YOU HAVE " + hero.xp + " XP", 300, 100);
  text("HP: " + hero.hpMax, 297, 200);
  text("SPEED: " + hero.speed, 320, 300);
  text("DAMAGE: " + hero.damage, 320, 400);
}


void pauseClicks() {
}
