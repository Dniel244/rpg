boolean mouseReleased, wasPressed;


AnimatedGif myGif;
Button start;



int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;

//COLOR PALLET
color lightGrey = #898383;
color darkGrey = #645F5F;
color black = 0;
color purple = #8114C6;
color brown = #6A400A;

//GAME OBJECTS
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Hero hero;



//MOVEMENT VARIABLES
boolean up, down, left, right, spacekey;

void setup() {
  size(800, 800);
  mode = INTRO;
  myGif = new AnimatedGif(55, "frame_", "_delay-0.06s.gif", width/2, height/2, width, height);
  start = new Button(width/2, height/2+200, 200, 100, #FF0825, #13FF08);

  //CREATE OBJECTS
  myObjects = new ArrayList<GameObject>(1000);
  hero = new Hero();
  myObjects.add(hero);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  }
}

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}