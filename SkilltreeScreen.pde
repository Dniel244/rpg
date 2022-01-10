boolean p = false;
boolean o = false;
boolean l = false;
boolean k = false;
boolean m = false;
boolean n = false;
boolean b = false;
boolean v = false;
boolean g = false;
void skilltree() {

  click();


  rectMode(CENTER);
  image(iSkilltree, width/2, height/2, width, height);
  color roomColor;
  roomColor = map.get(hero.roomX, hero.roomY);
  if (tree == false) {
    if (roomColor == mapGreen) {
      mode = GAME;
    }
  }

  fill(white);
  textSize(50);
  text("YOU HAVE        Skill Points", width/2, 100);
  fill(purple);
  text("   "+hero.skp, width/2, 100);

  strokeWeight(3);

  shield1.show();
  shield2.show();
  dash1.show();
  dash2.show();
  dash3.show();



  if (hero.skp >= 2) {
    if (shield1.clicked) {
      p = true;
      hero.skp = hero.skp - 2;
    }
    if (dash1.clicked) {
      k = true;
      hero.skp = hero.skp - 2;
    }
  }

  if (hero.skp >= 3) {
    if (p) {
      if (shield2.clicked) {
        o = true;
        hero.skp = hero.skp - 3;
      }
    }
    if (k) {
      if (dash2.clicked) {
        m = true;
        hero.skp = hero.skp - 3;
      }
    }
  }


  if (hero.skp >= 5) {

    if (m) {
      if (dash3.clicked) {
        n = true;
        hero.skp = hero.skp - 5;
      }
    }
  }



  if (p) {
    stroke(white);
  } else {
    stroke(darkGrey);
  }
  a1.show();



  if (k) {
    stroke(white);
  } else {
    stroke(darkGrey);
  }

  a3.show();

  if (m) {
    stroke(white);
  } else {
    stroke(darkGrey);
  }

  a4.show();


}
