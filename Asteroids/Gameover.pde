void Gameover() {
  if (bool) {
    if (ship.lives==0) {
      win=false;
    } else if (ship.lives>0) {
      win=true;
    }
    bool=false;
  }
  if (!win) {
    image(destiny2lost,width/2,height/2,width,height);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(255);
    text("You lost", width/2, height*0.775);
    text("Click to restart", width/2, height*0.82);
  } else if (win) {
    image(destiny2win,width/2,height/2);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(255);
    text("You win", width/2, height*0.775);
    text("Click to restart", width/2, height*0.82);
  }
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
  wbarAngle=0;
  qcd=wcd=ecd=rcd=true;
  boost=ifUFODie=false;
  numAster=0;
  gif = new PImage[150];
  for (int i=0; i<150; i++) {
    gif[i]=loadImage("frame_"+i+"_delay-0.06s.png");
  }
  font=createFont("8-bit-hud.ttf", 128);
  textFont(font);
  qcdAngle=wcdAngle=ecdAngle=rcdAngle=0;
  timer=0;
}
