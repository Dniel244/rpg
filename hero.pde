class Hero extends GameObject {
  float speed;
  int roomX, roomY;
  Hero() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 50;
    hp = 1;
    speed = 5;
    roomX = 1;
    roomY = 1;
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
    
    //check exits
    if (northRoom != #FFFFFF && loc.y == 75 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY--;
      loc = new PVector(width/2, 725);
    }
    
    if (eastRoom != #FFFFFF && loc.y >= height/2-50 && loc.y <= height/2+50 && loc.x == 725) {
      roomX++;
      loc = new PVector(75, height/2);
    }
    
    if (southRoom != #FFFFFF && loc.y == 725 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY++;
      loc = new PVector(width/2, 75);
    }
    
    if (westRoom != #FFFFFF && loc.y >= height/2-50 && loc.y <= height/2+50 && loc.x == 75) {
      roomX--;
      loc = new PVector(725, height/2);
    }
  }
}
