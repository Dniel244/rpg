class Bullet_Particles extends GameObject {
  int t; //transperency


//Particles constructor
  Bullet_Particles(float x, float y, float vx, float vy) {
    hp = 1;
    size = 5;
    t = 255;   
    loc = new PVector(x, y);
    vel = new PVector(vx, vy);
    vel.rotate(PI+random(-10, 10)); //180 degree
    vel.setMag(2); //how far they travel
  }

//how particles appear
  void show() {
    fill(red, t);
    square(loc.x, loc.y, size);
  }
//deleting particles
  void act() {
    super.act();
    t = t - 10;
    if (t <= 0) hp = 0;
  }
}
