import processing.javafx.*;
int mode;
final int intro=0;
final int game=1;
final int pause=2;
final int gameover=3;
final int instruction=4;
boolean upkey, downkey, leftkey, rightkey, spacekey, qkey, wkey, ekey, rkey;
boolean qcd, wcd, ecd, rcd;
boolean boost;
boolean bool, win;
Ship ship;
UFO ufo;
int time, numAster, timer;
float qbarAngle, qcdAngle;
float wbarAngle, wcdAngle;
float ebarAngle, ecdAngle;
float rbarAngle, rcdAngle;
boolean ifUFO, ifUFODie;
ArrayList<GameObject> object;
PImage []gif;
int f;
PFont font;
void setup() {
  fullScreen(FX2D);
  rectMode(CENTER);
  imageMode(CENTER);
  ship= new Ship();
  ifUFO=true;
  object = new ArrayList<GameObject>();
  object.add(ship);
  object.add(new Asteroid());
  object.add(new Asteroid());
  object.add(new Asteroid());
  object.add(new Asteroid());
  object.add(new Asteroid());
  object.add(new Asteroid());
  object.add(new Asteroid());
  object.add(new Asteroid());
  object.add(new Asteroid());
  time=1000;
  timer=0;
  qbarAngle=wbarAngle=ebarAngle=rbarAngle=0;
  qcd=wcd=ecd=rcd=true;
  boost=ifUFODie=false;
  bool=true;
  numAster=0;
  gif = new PImage[150];
  for (int i=0; i<150; i++) {
    gif[i]=loadImage("frame_"+i+"_delay-0.06s.png");
  }
  font=createFont("8-bit-hud.ttf", 128);
  textFont(font);
  mode=intro;
}

void draw() {
  if (mode==intro) {
    Intro();
  } else if (mode==game) {
    Game();
  } else if (mode== pause) {
    Pause();
  } else if (mode==gameover) {
    Gameover();
  } else if (mode==instruction) {
    Instruction();
  }
}

void keyPressed() {
  if (keyCode == UP)
    upkey=true;
  if (keyCode == DOWN)
    downkey=true;
  if (keyCode == LEFT)
    leftkey=true;
  if (keyCode == RIGHT)
    rightkey=true;
  if (keyCode == ' ')
    spacekey=true;
}

void keyReleased() {
  if (keyCode == UP)
    upkey=false;
  if (keyCode == DOWN)
    downkey=false;
  if (keyCode == LEFT)
    leftkey=false;
  if (keyCode == RIGHT)
    rightkey=false;
  if (keyCode == ' ')
    spacekey=false;
  if (ship.immunity<=0) {
    if (keyCode == 'q'||keyCode=='Q') {
      if (qcd==false)
        qkey=true;
    }
    if (keyCode == 'w'||keyCode=='W') {
      if (wcd==false)
        wkey=true;
    }
    if (keyCode == 'e'||keyCode=='E') {
      if (ecd==false)
        ekey=true;
    }
    if (keyCode == 'r'||keyCode=='R') {
      if (rcd==false)
        rkey=true;
    }
  }
  if (mode==game) {
    if (keyCode =='p'||keyCode=='P') {
      mode=pause;
    }
  } else if (mode==pause) {
    if (key=='p'||key=='P') {
      mode=game;
    }
  }
}
