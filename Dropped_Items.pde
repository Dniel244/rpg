class DroppedItem extends GameObject {

  int type;
  int ic;
  Weapon w;

  DroppedItem(float x, float y, int rx, int ry, int t, Weapon u) {
    type = t;
    w = u;
    hp = 1;
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = ic;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(ic);
    circle(loc.x, loc.y, size);
  }
  
  void act() {
   //no act! 
  }
}
