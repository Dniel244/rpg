void intro() { 
  rectMode(CENTER);
  myGif.show();
  start.show();
  click();
  fill(yellow);
  textFont(Dungeon);
  textAlign(CENTER, CENTER);
  textSize(100);
  text("Dungeon Crawl", width/2, height/2-200);

  if (start.clicked) {
    mode = GAME;
  }
}

void introClicks() {
}
