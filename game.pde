void game() {
  background(#767676);
  //paddle
  fill(#FF00E1);
  strokeWeight(4);
  stroke(#000000);
  circle(px, py, pd);
  if (akey) px = px-5;
  if (dkey) px = px+5;
  px = min(max(0, px), width);
  //ball
  fill(#FFFFFF);
  strokeWeight(4);
  stroke(#000000);
  circle(bx, by, bd);
  if (timer<0) {
    bx += vx;
    by += vy;
  }
  //bouncing
  if (dist(px, py, bx, by) < (bd + pd)/2) {
    vx = (bx-px)/6;
    vy = (by-py)/6;
  }
  if (by < bd/2) {
    vy = -vy;
  }
  if (bx < bd/2 || bx > width-bd/2) {
    vx = -vx;
  }
  //bricks
  int i = 0;
  while (i<n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }
  //scoreboard
  textFont(oya);
  textSize(40);
  fill(#FFFFFF);
  text("score: " + score, 150, 750);
  timer = timer -0.017;
  //lose lives
  textFont(oya);
  textSize(40);
  fill(#FFFFFF);
  text("lives: " + lives, 650, 750);
  if (by > height-bd/2) {
    lives--;
    bx = width/2;
    by = height-200;
    vx = 0;
    vy = 3;
    timer = 3;
  }
  //go to end screen
  if (score == 39) {
    mode = GAMEOVER;
  }
  if (lives == 0) {
    mode = GAMEOVER;
  }
}

void manageBrick(int i) {
  if (y[i] == 50) fill(#FF0000);
  if (y[i] == 125) fill(#FFAA00);
  if (y[i] == 200) fill(#FFFF00);
  if (y[i] == 275) fill(#00FF00);
  if (y[i] == 350) fill(#00FFFF);
  if (y[i] == 425) fill(#0000FF);
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) {
    vx = (bx-x[i])/10;
    vy = (by-y[i])/10;
    alive[i] = false;
    score++;
  }
}
void gameClicks() {
  mode = PAUSE;
}
