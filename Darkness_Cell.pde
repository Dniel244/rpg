class DarknessCell {
  float opacity;
  float x, y, size, d;

  DarknessCell(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 0;
  }

  void show() {


    rectMode(CORNER);


    d = dist(x, y, hero.loc.x, hero.loc.y);
    opacity = map( d, 0, 600, 0, 255);
    fill(black, opacity);
    noStroke();
    square(x, y, size);
  }
}
