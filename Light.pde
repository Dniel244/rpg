class Light extends GameObject {
  int s;
  int i;
  Light(float x, float y, int rx, int ry) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    hp = 1;

    roomX = rx;
    roomY = ry;
    //loc.rotate(radians(r));
  }

  void show() {
  }
}
