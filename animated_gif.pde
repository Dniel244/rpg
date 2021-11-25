class AnimatedGif {
  PImage[] gif;
  int numFrames;
  int currentFrame;
  int x, y, w, h;
  int rate = 1;

  AnimatedGif(int nf, String pre, String post, int x_, int y_, int w_, int h_) {
    numFrames = nf;
    gif = new PImage[numFrames];
    currentFrame = 0;
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    int i = 0;
    while (i < numFrames) {
      gif[i] = loadImage(pre+i+post);
      i++;
    }
  }

  AnimatedGif(int nf, int r, String pre, String post) {
    numFrames = nf;
    gif = new PImage[numFrames];
    currentFrame = 0;
    //loadImages(prefix, suffix);
    rate = r;


    int i = 0;
    while (i < numFrames) {
      gif[i] = loadImage(pre+i+post);
      i++;
    }
  }

  void show() {
    imageMode(CENTER);
    image(gif[currentFrame], x, y, w, h);
    currentFrame++;
    if (currentFrame == numFrames) currentFrame = 0;
  }



  void show(float x, float y, float w, float h) {
    imageMode(CENTER);
    if (currentFrame >= gif.length) currentFrame = 0;
    image(gif[currentFrame], x, y, w, h);
    if (frameCount % rate == 0) currentFrame++;
  }
}
