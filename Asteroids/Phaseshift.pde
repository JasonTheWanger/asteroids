class Phaseshift extends GameObject{
  int t;
  PVector direction;
  Phaseshift(){
  location=ship.location.copy();  
  direction=ship.direction.copy();
  t=255;
  lives=1;
  }
  void show(){
   pushMatrix();
   translate(location.x, location.y);
   rotate(direction.heading());
   noFill();
   stroke(#ED4D98,t);
   triangle(-25,-12.5,-25,12.5,25,0);
   popMatrix();
  }
  void act(){
   t-=8;
   if(t<=0){
    lives--; 
   }
  }
  
  
}
