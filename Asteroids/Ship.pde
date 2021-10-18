class Ship extends GameObject {


  PVector direction;
  int shotTimer, threshold, immunity;
  boolean livesDeduct, flag, teleport;
  float temp;
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer =0;
    threshold=60;
    livesDeduct=false;
    immunity=180;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();
    //immunity
    if (immunity>=0) {
      stroke(#5E88D8);
      circle(0, 0, 90);
    }
    // end of immunity
    // q Ability
    if (qkey&&qcd==false) {
      boost=true;
      qbarAngle+=10;
      if (qbarAngle>=360) {
        qkey=false;
        qbarAngle=0;
        qcd=true;
        flag=false;
      }
    } else if (qcd) {
      boost=false;
      qcdAngle+=5;
      if (qcdAngle>=360) {
        qcd=false;
        qcdAngle=0;
      }
    } else {
      boost=false;
      temp=velocity.mag();
    }
    //end of q ability
    //w Ability
    if (wkey&&wcd==false) {
      stroke(#ED4D98);
      wbarAngle+=2;
      if (wbarAngle>=360) {
        wkey=false;
        wbarAngle=0;
        wcd=true;
      }
    } else if (wcd) {
      stroke(255);
      wcdAngle+=0.75;
      if (wcdAngle>=360) {
        wcd=false;
        wcdAngle=0;
      }
    } else {
      stroke(255);
    }
    //end of w Ability
    //r (teleport) ability
    if (rkey&&rcd==false) {
      while (true) {
        teleport=true;
        location.x=random(0, width);
        location.y=random(0, width);
        for (int i=0; i<object.size(); i++) {
          GameObject GB = object.get(i);
          if (GB instanceof Asteroid) {
            if (dist(location.x, location.y, GB.location.x, GB.location.y)<=225+GB.size/2)
              teleport=false;
          }
        }
        if (teleport)
          break;
      }
      rkey=false;
      rcd=true;
    } else if (rcd) {
      rcdAngle+=0.5;
      if (rcdAngle>=360) {
        rcd=false;
        rcdAngle=0;
      }
    }
    //end of r ability
    triangle(-25, -12.5, -25, 12.5, 25, 0);

    popMatrix();
  }
  void act() {
    super.act();

    shotTimer++;

    if (upkey) {
      velocity.add(direction);
      object.add(new GNParticles());
      object.add(new GNParticles());
      object.add(new GNParticles());
      if (wkey)
        object.add(new Phaseshift());
    }
    if (boost&&immunity<=0) {
      velocity.add(direction);
      velocity.setMag(velocity.mag()*20);
      object.add(new GNParticles());
      object.add(new GNParticles());
      object.add(new GNParticles());
    }
    if (!flag) {
      velocity.setMag(temp);
      flag=true;
    }
    if (downkey)
      velocity.sub(direction);
    if (leftkey)
      direction.rotate(radians(-5));
    if (rightkey)
      direction.rotate(radians(5));
    if (spacekey && shotTimer>threshold) {
      object.add(new Bullet());
      shotTimer=0;
    }
    if (velocity.mag()>7)
      velocity.setMag(7);

    if (livesDeduct) {
      lives--;
      livesDeduct=false;
      location = new PVector(width/2, height/2);
      velocity = new PVector(0, 0);
      direction = new PVector(0, -0.1);
      immunity=180;
    }
    if (immunity<=180) {
      immunity--;
    }
    for (int i=0; i<object.size(); i++) {
      GameObject GB = object.get(i);
      if (GB instanceof UFOBullet) {
        if (immunity<=0)
          if (dist(location.x, location.y, GB.location.x, GB.location.y)<=25+ GB.size) {
            if (!wkey) {
              livesDeduct=true;
              for (int c=0; c<30; c++)
                object.add(new AsteroidParticles(location.x, location.y, #FFFFFF));
            }
          }
      } else if (GB instanceof Asteroid || GB instanceof UFO) {

        if (ekey&&ecd==false) {
          if (immunity<=0)
            if (dist(location.x, location.y, GB.location.x, GB.location.y)<=GB.size/2 + 25) {
              if (!wkey)
                livesDeduct=true;
              if (GB instanceof Asteroid)
                GB.lives--;
              else {
                ifUFODie=true;
                ufo.lives--;
                for (int c=0; c<30; c++)
                  object.add(new AsteroidParticles(location.x, location.y, #D8B423));
              }
              for (int c=0; c<30; c++) {
                if (GB instanceof Asteroid)
                  object.add(new AsteroidParticles(GB.location.x, GB.location.y, #FF0000));
                if (!wkey)
                  object.add(new AsteroidParticles(location.x, location.y, #FFFFFF));
              }
            }
          ebarAngle+=(1.25/(numAster+1));
          if (ebarAngle>=360) {
            ekey=false;
            ebarAngle=0;
            ecd=true;
          }
        } else if (ecd) {
          ecdAngle+=(0.65/(numAster+1));
          if (immunity<=0&&!wkey)
            if (dist(location.x, location.y, GB.location.x, GB.location.y)<=GB.size/2 + 25) {
              livesDeduct=true;
              for (int c=0; c<30; c++) {
                object.add(new AsteroidParticles(location.x, location.y, #FFFFFF));
              }
            }
          if (ecdAngle>=360) {
            ecd=false;
            ecdAngle=0;
          }
        } else {
          if (immunity<=0&&!wkey)
            if (dist(location.x, location.y, GB.location.x, GB.location.y)<=GB.size/2 + 25) {
              livesDeduct=true;
              for (int c=0; c<30; c++) {
                object.add(new AsteroidParticles(location.x, location.y, #FFFFFF));
              }
            }
        }
      }
      if (GB instanceof Ship) {
        if (ekey&&ecd==false) {
          ebarAngle+=(1.5/(numAster+1));
          if (ebarAngle>=360) {
            ekey=false;
            ebarAngle=0;
            ecd=true;
          }
        }
        if (ecd) {
          ecdAngle+=(0.55/(numAster+1));
          if (ecdAngle>=360) {
            ecd=false;
            ecdAngle=0;
          }
        }
      }
    }
  }
}
