void Game() {
  background(0);
  for (int i=0; i<object.size(); i++) {
    GameObject GB = object.get(i);
    if (GB instanceof Asteroid) {
      numAster++;
    }
  }
  for (int i=0; i<object.size(); i++) {
    GameObject GB = object.get(i);
    GB.show();
    GB.act();

    if (GB.lives<=0) {
      if (GB instanceof UFO) {
        time=1000;
        ifUFO=true;
      }
      object.remove(i);
      i--;
    }
  }
  time--;
  if (time<=0&&ifUFO&&!ifUFODie) {
    int temp=int(random(0, 4));
    if (temp==0) {

      ufo=new UFO(random(15, width-15), -15, random(-0.15, 0.15), random(0.3, 0.7));
    } else if (temp==1) {
      ufo=new UFO(random(15, width-15), height+15, random(-0.15, 0.15), random(-0.3, -0.7));
    } else if (temp==2) {
      ufo=new UFO(-15, random(15, height-15), random(0.3, 0.7), random(-0.15, 0.15));
    } else if (temp==3) {
      ufo=new UFO(width+15, random(15, height-15), random(-0.3, -0.7), random(-0.15, 0.15));
    }
    object.add(ufo);
    ifUFO=false;
  }
  //q Ability
  noFill();
  strokeWeight(2);
  stroke(255);
  circle(100, 100, 70);
  strokeWeight(3);
  stroke(255, 0, 0);
  line(100, 100, 100, 68);
  pushMatrix();
  translate(100, 100);
  if (!qcd) {
    rotate(radians(qbarAngle));
  } else if (qcd) {
    rotate(radians(qcdAngle));
  }
  stroke(255);
  line(0, 0, 0, -32);
  popMatrix();
  // end of q Ability
  // w Ability
  noFill();
  strokeWeight(2);
  stroke(255);
  circle(200, 100, 70);
  strokeWeight(3);
  stroke(255, 0, 0);
  line(200, 100, 200, 68);
  pushMatrix();
  translate(200, 100);
  if (!wcd) {
    rotate(radians(wbarAngle));
  } else if (wcd) {
    rotate(radians(wcdAngle));
  }
  stroke(255);
  line(0, 0, 0, -32);
  popMatrix();
  //end of w Ability
  //e Ability
  noFill();
  strokeWeight(2);
  stroke(255);
  circle(300, 100, 70);
  strokeWeight(3);
  stroke(255, 0, 0);
  line(300, 100, 300, 68);
  pushMatrix();
  translate(300, 100);
  if (!ecd) {
    rotate(radians(ebarAngle));
  } else if (ecd) {
    rotate(radians(ecdAngle));
  }
  stroke(255);
  line(0, 0, 0, -32);
  popMatrix();
  //end of e Ability
  // teleport Ability (r)
  noFill();
  strokeWeight(2);
  stroke(255);
  circle(400, 100, 70);
  strokeWeight(3);
  stroke(255, 0, 0);
  line(400, 100, 400, 68);
  pushMatrix();
  translate(400, 100);
  if (rcd) {
    rotate(radians(rcdAngle));
  }
  stroke(255);
  line(0, 0, 0, -32);
  popMatrix();
  //end of teleport
  //lives
  if (ship.lives==3) {
    fill(255);
    circle(width-200, 80, 20);
    fill(255);
    circle(width-150, 80, 20);
    fill(255);
    circle(width-100, 80, 20);
  } else if (ship.lives==2) {
    fill(255);
    circle(width-150, 80, 20);
    fill(255);
    circle(width-100, 80, 20);
  } else if (ship.lives==1) {
    fill(255);
    circle(width-100, 80, 20);
  }
  //end of lives
  if (ship.lives==0) {
    timer++;
    if(timer==100)
    mode=gameover;
  }
  if (numAster==0) {
    timer++;
    if(timer==100)
    mode=gameover;
  }
  numAster=0;
}
