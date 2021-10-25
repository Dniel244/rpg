class Hero extends GameObject {
  float speed = 5;
  Hero() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 50;
    lives = 3;
  }

  void show() {
    fill(brown);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();
    if (up) vel.y = -speed;
    if (down)  vel.y = speed;
    if (left) vel.x = -speed;
    if (right) vel.x = speed;
    
    if (vel.mag() > 5) vel.setMag(5);

    if (!up && !down) vel.y = 0;
    if (!left && !right) vel.x = 0;
  }
}
