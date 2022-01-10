class Arrow extends GameObject {
  int x, y;
  Arrow(int x_, int y_) {
   hp = 1;
   loc = new PVector(x_, y_);
   x = x_;
   y = y_;
   c = darkGrey;
  }
  
  void show() {
    fill(c);
    line(x, y, x, y-100);
    line(x, y, x+20, y-20);
    line(x, y, x-20, y-20);
  }
}
