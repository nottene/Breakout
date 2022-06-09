void intro() {
  background(#767676);
  image(gif[f], 0, 0, width, height);
  if (frameCount%3==0) f++;
  if (f == numberOfFrames) f = 0;
  textFont(oya);
  textSize(80);
  fill(#FFFFFF);
  text("RAINBOW BREAKER", width/2, 250);
  //play button
  rectButton(300, 500, 500, 600);
  fill(#FFFFFF);
  strokeWeight(2);
  rect(300, 500, 200, 100);
  fill(#000000);
  textSize(40);
  text("BREAK!!!", width/2, 565);
}

void introClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
  }
}
