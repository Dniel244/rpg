class GameObject {
  PVector loc, vel; 
  int size;
  int hp;

  GameObject() {
  }

  void act() {
    //move
    loc.add(vel);

    //bounce of walls
    if (loc.x > 725) {
      loc.x = 724;
    }

    if (loc.x < 75) {
      loc.x = 76;
    }

    if (loc.y > 725) {
      loc.y = 724;
    }

    if (loc.y < 75) {
      loc.y = 76;
    }
  }
  
  void show() {
    
  }
}
