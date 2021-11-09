class GameObject {
  PVector loc, vel; 
  int size;
  int hp;
  int roomX, roomY;

  GameObject() {
  }

  void act() {
    //move
    loc.add(vel);

    //bounce of walls
    if (loc.x >= 725) {
      loc.x = 725;
    }

    if (loc.x <= 75) {
      loc.x = 75;
    }

    if (loc.y >= 725) {
      loc.y = 725;
    }

    if (loc.y <= 75) {
      loc.y = 75;
    }
  }

  void show() {
  }
}
