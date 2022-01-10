
class Message extends GameObject {
  String msg;
  int msgTimer;
  int msgThreshold;
  int t = 255;
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
    fill(white, t);
    text(msg, loc.x, loc.y);
  }

  void act() {
    msgTimer++;
    if (msgTimer < msgThreshold) {
      loc.y--;
      t = t - 8;
    } 
    if (msgTimer >= msgThreshold) hp = 0;
  }
}
