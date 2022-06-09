void pause() {
  background(#767676);
   image(gif[f], 0, 0, width, height);
  if(frameCount%3==0) f++;
  if (f == numberOfFrames) f = 0;
  textSize(150);
  fill(#FFFFFF);
  text("PAUSE", width/2,height/2);
  textSize(20);
  fill(#FFFFFF);
  text("<click anywhere to resume>", width/2, 600);
}

void pauseClicks() {
  mode = GAME;
}
