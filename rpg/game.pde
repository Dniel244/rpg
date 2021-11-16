void game() {

if (hero.hp <= 0) {
  mode = GAMEOVER;
}
  rectMode(CENTER);
  background(black);
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMiniMap();

  //health
  textAlign(CENTER, CENTER);
  fill(red);
  textSize(50);
  text(hero.hp, width-width/4, 100);
}

void drawRoom() {
  stroke(lightGrey);
  fill(lightGrey);
  rect(width/2, height/2, width, height);
  stroke(black);
  line(0, 0, width, height);

  line(width, 0, 0, height);
  fill(darkGrey);
  rect(width/2, height/2, 700, 700);

  //exits
  northRoom = map.get(hero.roomX, hero.roomY-1);
  eastRoom = map.get(hero.roomX+1, hero.roomY);
  southRoom = map.get(hero.roomX, hero.roomY+1);
  westRoom = map.get(hero.roomX-1, hero.roomY);
  fill(black);


  fill(black);

  if (northRoom != #FFFFFF) {
    quad(width/2 - 50, 5, width/2 - 25, 50, width/2 + 25, 50, width/2 + 50, 5);
  }
  if (eastRoom != #FFFFFF) {
    quad(width - 5, height/2 - 50, 750, height/2 - 25, 750, height/2 + 25, width - 5, height/2 + 50);
  }
  if (southRoom != #FFFFFF) {
    quad(width/2 - 50, height - 5, width/2 - 25, 750, width/2 + 25, 750, width/2 + 50, height - 5);
  }
  if (westRoom != #FFFFFF) {
    quad(5, height/2 - 50, 50, height/2 - 25, 50, height/2 + 25, 5, height/2 + 50);
  }
}

void drawGameObjects() {
  int i = 0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == hero.roomX && obj.roomY == hero.roomY) {
      obj.show();
      obj.act();
      if (obj.hp <= 0) {
        myObjects.remove(i);
        i--;
      }
    }
    i++;
  }
}


void drawLightLayer() {
  int i = 0;
  while (i < darkness.size()) {
    DarknessCell dark = darkness.get(i);
    dark.show();     
    i++;
  }
}

void drawMiniMap() {
  miniMap = new ArrayList<MiniMap>(1000);
  int sizeM = 15;
  int xM = 0;
  int yM = 0;
  color c;
  while (yM < map.height) {
    if (roomx == xM && roomy == yM) {
      c = blue;
    } else {
      c = map.get(xM, yM);
    }
    fill(c);
    square(10*xM + 25, 10*yM + 25, sizeM);
    xM++;
    ;
    if (xM >= map.width) {
      xM = 0;
      yM++;
      ;
    }
  }
}
