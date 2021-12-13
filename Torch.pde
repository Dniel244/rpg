class Torch extends GameObject {
  int s;
  int i;
  Torch(int x, int y, int s_, int i_, float r, int rx, int ry) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    hp = 1;
    s = s_;
    i = i_;
    roomX = rx;
    roomY = ry;
    //loc.rotate(radians(r));
  }

  void show() {
    fill(red);
    ellipse(loc.x, loc.y+i, 10, 20);
    fill(yellow);
    ellipse(loc.x, loc.y+i, 5, 15);
    fill(brown);
    triangle(loc.x-7, loc.y+i, loc.x+7, loc.y+i, loc.x+s, loc.y-i+30);
  }
}
