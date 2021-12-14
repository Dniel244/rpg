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



  int x = width/2;
  int y = height/2;
  if (northRoom != #FFFFFF) {
    fill(black);
    quad(width/2 - 50, 5, width/2 - 25, 50, width/2 + 25, 50, width/2 + 50, 5);

    fill(red);
    ellipse(x-85, y/4-85, 10, 20);
    fill(yellow);
    ellipse(x-85, y/4-85, 5, 15);
    fill(brown);
    triangle(x-85-7, y/4-85, x-85+7, y/4-85, x-85+7, y/4-85+30);

    fill(red);
    ellipse(x+85, y/4-85, 10, 20);
    fill(yellow);
    ellipse(x+85, y/4-85, 5, 15);
    fill(brown);
    triangle(x+85-7, y/4-85, x+85+7, y/4-85, x+85-7, y/4-85+30);
  }
  if (eastRoom != #FFFFFF) {
    fill(black);
    quad(width - 5, height/2 - 50, 750, height/2 - 25, 750, height/2 + 25, width - 5, height/2 + 50);

    fill(red);
    ellipse(x*2-15, y-85, 20, 10);
    fill(yellow);
    ellipse(x*2-15, y-85, 15, 5);
    fill(brown);
    triangle(x*2-15, y-85-7, x*2-15, y-85+7, x*2-45, y-85+7);

    fill(red);
    ellipse(x*2-15, y+85, 20, 10);
    fill(yellow);
    ellipse(x*2-15, y+85, 15, 5);
    fill(brown);
    triangle(x*2-15, y+85-7, x*2-15, y+85+7, x*2-45, y+85-7);
  }
  if (southRoom != #FFFFFF) {
    fill(black);
    quad(width/2 - 50, height - 5, width/2 - 25, 750, width/2 + 25, 750, width/2 + 50, height - 5);

    fill(red);
    ellipse(x-85, y*2-45+30, 10, 20);
    fill(yellow);
    ellipse(x-85, y*2-45+30, 5, 15);
    fill(brown);
    triangle(x-85-7, y*2-45+30, x-85+7, y*2-45+30, x-85+7, y*2-45);

    fill(red);
    ellipse(x+85, y*2-45+30, 10, 20);
    fill(yellow);
    ellipse(x+85, y*2-45+30, 5, 15);
    fill(brown);
    triangle(x+85-7, y*2-45+30, x+85+7, y*2-45+30, x+85-7, y*2-45);
    myObjects.add (new Light(x+85, y*2-45+30, hero.roomX, hero.roomY));
  }
  if (westRoom != #FFFFFF) {
    fill(black);
    quad(5, height/2 - 50, 50, height/2 - 25, 50, height/2 + 25, 5, height/2 + 50);

    fill(red);
    ellipse(x/7-45, y-85, 20, 10);
    fill(yellow);
    ellipse(x/7-45, y-85, 15, 5);
    fill(brown);
    triangle(x/7-45, y-85-7, x/7-45, y-85+7, x/7-45+35, y-85+7);

    fill(red);
    ellipse(x/7-45, y+85, 20, 10);
    fill(yellow);
    ellipse(x/7-45, y+85, 15, 5);
    fill(brown);
    triangle(x/7-45, y+85-7, x/7-45, y+85+7, x/7-45+35, y+85-7);
  }

  color roomColor;
  roomColor = map.get(hero.roomX, hero.roomY);

  if (roomColor == mapGreen) {
    shop.show();
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

void gameClicks() {
  color roomColor;
  roomColor = map.get(hero.roomX, hero.roomY);

  if (roomColor == mapGreen) {
    mode = SHOP;
  }
}
