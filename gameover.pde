void gameover() {
  background(#767676);
  image(gif[f], 0, 0, width, height);
  if (frameCount%3==0) f++;
  if (f == numberOfFrames) f = 0;
  if (score == 39) {
    textFont(oya);
    textSize(120);
    fill(#FFFFFF);
    text("YOU WON!!!", width/2, 200);
  }
  if (lives == 0) {
    textFont(oya);
    textSize(120);
    fill(#FFFFFF);
    text("YOU LOST!!!", width/2, 200);
  }
  textSize(20);
  fill(#FFFFFF);
  text("<click anywhere to restart>", width/2, 600);
}

void gameoverClicks() {
  mode = INTRO;
  bx = width/2;
  by = height-200;
  px = width/2;
  py=height;
  vx = 0;
  vy = 3;
  score = 0;
  timer = 3;
  lives = 3;
  n = 39;
  x = new int [n];
  y = new int [n];
  alive = new boolean[n];
  tempx = 100;
  tempy = 50;
  int i = 0;
  while (i<n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx += 100;
    if (tempx == width) {
      tempx = 150;
      tempy += 75;
    }
    if (tempx == 750) {
      tempx = 100;
      tempy += 75;
    }
    i++;
  }
}
