void intro() { 
  myGif.show();
  start.show();
  click();
  
  if (start.clicked) {
    mode = GAME;
  }

}
