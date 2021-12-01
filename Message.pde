class Message extends GameObject {
  String msg;
  int msgTimer;
  int msgThreshold;
  Message(PVector loc_, String s, int rx, int ry) {
    loc = loc_;
    roomX = rx;
    roomY = ry;
    hp = 1;
    msg  = s;
    msgTimer = 0;
    msgThreshold = 50;
  }

  void show() {
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(white);
    text(msg, loc.x, loc.y);
  }

  void act() {
    msgTimer++;
    println(msgTimer);
    if (msgTimer < msgThreshold) {
      loc.y--;
    } if (msgTimer >= msgThreshold) hp = 0;
   
  }
}
