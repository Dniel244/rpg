void gameover() {
  background(darkdarkGrey);
  textAlign(CENTER, CENTER);
  textSize(100);
  fill(brown);
  text("GAMEOVER", width/2, height/2);
}

void gameoverClicks() {
  mode = INTRO;
  
  
  int i = 0;
  while (i < myObjects.size()) {
    myObjects.remove(i);
    i++;
  }
  
  hero.hp = 100;
  hero.roomX = 1;
  hero.roomY = 1;
  hero = new Hero();
  myObjects.add(hero);
  hero.hpMax = hero.hp = 100;
  hero.speed = 3;
  hero.damage = 5;
  ammo = 60;
  
}
