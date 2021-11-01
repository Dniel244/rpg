void game() {
  rectMode(CENTER);
  background(black);

  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMiniMap();
  
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
    obj.show();
    obj.act();
    if (obj.hp <= 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
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
  int sizeM = 50;
  int xM = 0, yM = 0;
  while (yM < map.height) {
  color c = map.get(xM, yM);
  fill(c);
  square(xM*5,yM*5,sizeM);
    xM++;
    if (xM >= map.width) {
      xM = 0;
      yM++;
    }
  }
}
