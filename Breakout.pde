import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//game entities
float bx, by, bd, vx, vy, px, py, pd;

//keyboard variables
boolean akey, dkey;

//brick variables
int[] x;
int[] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;
int score;
int lives;
float timer;
PFont oya;

//gif
PImage[] gif;
int numberOfFrames;
int f;

//sound variables
Minim minim;
AudioPlayer theme, bounce, loseLife, win, lose;

void setup() {
  size(800, 800, P2D);
  textAlign(CENTER);
  oya = createFont("Breakout font.ttf", 150);
  mode=INTRO;
  brickd = 60;
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
    
    //minim
    minim = new Minim(this);
    minim = new Minim(this);
    theme = minim.loadFile("theme.mp3");
    bounce = minim.loadFile("bounce.wav");
    loseLife = minim.loadFile("loseLife.wav");
    win = minim.loadFile("win.mp3");
    lose = minim.loadFile("lose.wav");
  }

  //set up paddle and ball
  bx = width/2;
  by = height-200;
  bd = 10;
  px = width/2;
  py=height;
  pd = 100;
  vx = 0;
  vy = 3;

  //initialize score
  score = 0;
  timer = 3;
  lives = 3;

  //gif
  numberOfFrames = 8;
  gif = new PImage[numberOfFrames];
  int a = 0;
  while (a < numberOfFrames) {
    gif[a] = loadImage("frame_"+a+"_delay-0.06s.gif");
    a++;
  }
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("MODE ERROR in draw: " + mode);
  }
}
