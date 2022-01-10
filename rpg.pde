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

int ammo = 60;


//FONT
PFont Dungeon;




//keyboard input
boolean mouseReleased, wasPressed;

//class variables
AnimatedGif myGif;
AnimatedGif manUp, manDown, manLeft, manRight;
Button start, healthUp, speedUp, damageUp, exit;
cButton shield1;
c2Button shield2;
c3Button shield3;
c4Button dash1;
c5Button dash2;
c6Button dash3;
c7Button autodmg1; 
c8Button autodmg2;
c9Button autodmg3;
Shop shop;
Skilltree skilltree;
Enemy enemy;
Arrow a1, a2, a3, a4, a5, a6;
Shield shield;


//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int SHOP = 4;
final int SKILLTREE = 5;

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
color darkPurple = #3F246A;

//MINI MAP
color mapBlue = #117b7a;
color mapPurple = #3f0a61;
color mapGreen = #1AFF00;


//GAME OBJECTS
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
ArrayList<MiniMap> miniMap;

Hero hero;
int roomx, roomy;

//Images
PImage map, iBullets, iSkilltree, iDash, iShield, iDmg;
color northRoom, eastRoom, southRoom, westRoom;

//Load GIFs



//KEYBOARD VARIABLES
boolean up, down, left, right, spacekey;
boolean tree = false;
boolean dashUp, dashDown, dashRight, dashLeft;

void setup() {
  rectMode(CENTER);
  size(800, 800);
  mode = INTRO;

  iDash = loadImage("dash.png");
  iDmg = loadImage("dmg.png");
  iShield = loadImage("shield.png");



  myGif = new AnimatedGif(55, "frame_", "_delay-0.06s.gif", width/2, height/2, width, height);
  shop = new Shop();
  skilltree = new Skilltree();
  start = new Button(width/2, height/2+200, 200, 100, red, green, 75, " ");
  healthUp = new Button(100, 200, 50, 50, white, green, 255, "+");
  speedUp = new Button(100, 300, 50, 50, white, green, 255, "+");
  damageUp = new Button(100, 400, 50, 50, white, green, 255, "+");
  exit = new Button(width-50, 50, 50, 50, lightGrey, red, 255, "X");

  shield1 = new cButton(200, 200, 80, 80, darkGrey, white, 255, "", blue, iShield);
  shield2 =  new c2Button(200, height/2, 80, 80, darkGrey, white, 255, "", blue, iShield);
  dash1 = new c4Button(600, 200, 80, 80, darkGrey, white, 255, "", green, iDash);
  dash2 =  new c5Button(600, height/2, 80, 80, darkGrey, white, 255, "", green, iDash);
  dash3 =  new c6Button(600, 600, 80, 80, darkGrey, white, 255, "", green, iDash);

  shield = new Shield();

  a1 = new Arrow(200, 350);
  a3 = new Arrow(600, 350);
  a4 = new Arrow(600, 550);

  map = loadImage("map.png");
  iBullets = loadImage("bullets.png");
  iSkilltree = loadImage("skilltree.png");

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
  } else if (mode == SHOP) {
    pause();
  } else if  (mode == SKILLTREE) {
    skilltree();
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
