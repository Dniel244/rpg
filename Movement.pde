int dashTimer = 0;
int dashThreshold = 500;
int dth = 500;
int shieldTimer = 300;
int shieldThreshold = 300;
boolean sShield = false;


void keyPressed() {
  if (key == 'w' || key == 'W') up = true;
  if (key == 's' || key == 'S') down = true;
  if (key == 'a' || key == 'A') left = true;
  if (key == 'd' || key == 'D') right = true;
  if (key == 'r' || key == 'R') {
    if (tree == false) {
      tree = true;
    } else if (tree == true) {

      tree = false;
    }
  }

  if (keyCode == 16) {
    dash();
  }

  if (keyCode == 17) {
    if (p) {
      if (o) {
        exShield = true;
      }
      shield();
    }
  }




  if (keyCode == ' ') {
    spacekey = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') up = false;
  if (key == 's' || key == 'S') down = false;
  if (key == 'a'|| key == 'A') left = false;
  if (key == 'd' || key == 'D') right = false;
  if (keyCode == ' ') spacekey = false;
}

void dash() {
  dashThreshold = dth;
  if (dashTimer >= dashThreshold) {
    if (up == true) {
      dashUp = true;
      dashTimer = 0;
    } else if (down == true) {
      dashDown = true;
      dashTimer = 0;
    } else if (left == true) {
      dashLeft = true;
      dashTimer = 0;
    } else if (right == true) {
      dashRight = true;
      dashTimer = 0;
    }
  }
}

void shield() {
  if (sDmg == true) {
    sDmg = false;
  }
  if (shieldTimer >= shieldThreshold) {
    shield.hp = 1;
    sShield = true;
  }
}
