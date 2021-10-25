void game() {
  background(lightGrey);

  drawRoom();




  hero.show();
  hero.act();
}

void drawRoom() {
  stroke(black);
  line(0, 0, width, height);

  line(width, 0, 0, height);
  fill(darkGrey);
  rect(width/2, height/2, 700, 700);

  fill(black);
  quad(width/2 - 50, height - 5, width/2 - 25, 750, width/2 + 25, 750, width/2 + 50, height - 5);
  quad(5, height/2 - 50, 50, height/2 - 25, 50, height/2 + 25, 5, height/2 + 50);
  quad(width/2 - 50, 5, width/2 - 25, 50, width/2 + 25, 50, width/2 + 50, 5);
  quad(width - 5, height/2 - 50, 750, height/2 - 25, 750, height/2 + 25, width - 5, height/2 + 50);
}

void drawGameObjects() {
  int i = 0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    obj.show();
    obj.act();
    if (obj.lives <= 0) {
      myObjects.remove(i);
      i--;
    }
  }
}
