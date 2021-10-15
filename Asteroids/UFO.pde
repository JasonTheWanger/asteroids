class UFO extends GameObject{
  PVector direction;
  int shotTimer, threshold;
  UFO(float x, float y, float dx, float dy){
    lives = 1;
  location = new PVector(x,y);
  direction = new PVector(dx,dy);
  velocity = new PVector(direction.x*10, direction.y*10);
  shotTimer =0;
  threshold=80;
  }
  void show(){
     pushMatrix();
   translate(location.x, location.y);
   rotate(direction.heading());
   stroke(#0B84DE);
   fill(#0B84DE);
   circle(0,0,30);
   noFill();
   stroke(255);
   circle(0,0,10);
   
   popMatrix();
  }
  void act(){
    location.add(velocity);
   if(location.y<-50)
   location.y =height+50;
   if(location.y>height+50)
   location.y=-50;
   if(location.x<-50)
   location.x=width+50;
   if(location.x>width+50)
   location.x=-50;
    shotTimer++;
    if(shotTimer>=threshold){
      object.add(new UFOBullet());
      shotTimer=0;
    }
    if(ufo.location.x>=width+20||ufo.location.x<=-20||ufo.location.y>=height+20||ufo.location.y<=-20){
     lives=0; 
     ifUFO=true;
    }
  }
}
