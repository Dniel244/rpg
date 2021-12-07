class GameObject {
  PVector loc, vel; 
  int size;
  int hp, hpMax;
  int roomX, roomY;
  int damage;
  float speed;
  int xp;
  color c;

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
  }//end of act


  boolean inRoomWith(GameObject myObj) {
    if (roomX == myObj.roomX && roomY == myObj.roomY)
      return true;
    else
      return false;
  }//end of inroomwith


  boolean isCollidingWith(GameObject myObj) {
    float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
    if (inRoomWith(myObj) && d < size/2 + myObj.size/2)
      return true;
    else
      return false;
  }//end of iscollidingwith

  boolean dead(GameObject myObj) {
    if (myObj.hp == 0) 
      return true;
    else
      return false;
  }


  void show() {
  }//end of show
}
