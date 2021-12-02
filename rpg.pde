/*
Daniel Altshuler
 RPG
 Nov 8, 2021
 */
//enemy: settings
int AMMO = 0;
int HEALTH = 1;
int GUN = 2;

int FOLLOWER_HEALTH = 100;
int FOLLOWER_SIZE = 50;

int LURKER_HEALTH = 100;
int LURKER_SIZE = 50;

int SPAWNER_HEALTH = 50;
int SPAWNER_SIZE = 100;

int TURRET_HEALTH = 150;
int TURRET_SIZE = 100;

//weapon: settings
int SNIPER_RIFLE_THRESHOLD = 50;
int SNIPER_RIFLE_BULLETSPEED = 20;

int AUTO_PISTOL_THRESHOLD = 10;
int AUTO_PISTOL_BULLETSPEED = 5;

int SHOTGUN_THRESHOLD = 50;
int SHOTGUN_BULLETSPEED = 5;




//FONT
PFont Dungeon;





//keyboard input
boolean mouseReleased, wasPressed;

//class variables
AnimatedGif myGif;
AnimatedGif manUp, manDown, manLeft, manRight;
Button start, healthUp, speedUp, damageUp, exit;


//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;

//COLOR PALLET
color lightGrey = #898383;
color darkGrey = #645F5F;
color darkdarkGrey = #2E2D2A;
color black = 0;
color purple = #8114C6;
color blue = #0E13CB;
color lightBlue = #0FFFFD;
color red = #FF0825;
color green = #12FF37;
color brown = #907826;
color yellow = #E9FA0A;
color pink = #FF5884;
color white = #FFFFFF;

//MINI MAP
color mapBlue = #117b7a;
color mapPurple = #3f0a61;


//GAME OBJECTS
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
ArrayList<MiniMap> miniMap;

Hero hero;
int roomx, roomy;

//Images
PImage map;
color northRoom, eastRoom, southRoom, westRoom;

//Load GIFs



//MOVEMENT VARIABLES
boolean up, down, left, right, spacekey;

void setup() {
  rectMode(CENTER);
  size(800, 800);
  mode = INTRO;
  myGif = new AnimatedGif(55, "frame_", "_delay-0.06s.gif", width/2, height/2, width, height);
  start = new Button(width/2, height/2+200, 200, 100, red, green, 75, " ");
  healthUp = new Button(100, 200, 50, 50, white, green, 255, "+");
  speedUp = new Button(100, 300, 50, 50, white, green, 255, "+");
  damageUp = new Button(100, 400, 50, 50, white, green, 255, "+");
  exit = new Button(width-50, 50, 50, 50, lightGrey, red, 255, "X");
  map = loadImage("map.png");

  manUp = new AnimatedGif(4, 10, "man/up/sprite_", ".png");
  manDown = new AnimatedGif(4, 10, "man/down/sprite_", ".png");
  manLeft = new AnimatedGif(4, 10, "man/left/sprite_", ".png");
  manRight = new AnimatedGif(4, 10, "man/right/sprite_", ".png");

  Dungeon = createFont("DUNG.TTF", 50);
  //CREATE OBJECTS
  myObjects = new ArrayList<GameObject>(1000);
  hero = new Hero();
  myObjects.add(hero);


  //CREATE DARKNESS

  darkness = new ArrayList<DarknessCell>(1000);
  float size = 5;
  int x = 0, y = 0;
  while (x <= width-size && y <= height-size) {
    darkness.add(new DarknessCell(x, y, size));
    x += size;
    if (x > width-size) {
      x = 0;
      y += size;
    }
  }

  //loading the enemies from the map
  x = 0;
  y = 0;
  int j, k;
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == mapBlue) {
      j = int(random(0, 2));
      if (j == 0) {
        myObjects.add(new Follower(x, y));
      } else if (j == 1) {
        myObjects.add(new Lurker(x, y));
      }
    }
    if (roomColor == mapPurple) {
      k = int(random(0, 2));
      if (k == 0) {
        myObjects.add(new Spawner(x, y));
      } else if (k == 1) {
        myObjects.add(new Turret(x, y));
      }
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
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
