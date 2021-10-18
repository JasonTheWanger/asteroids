class Bullet extends GameObject{
  

 Bullet(){
   lives =1;
   location=new PVector(ship.location.x, ship.location.y);
   velocity=new PVector(ship.direction.x, ship.direction.y);
   velocity.setMag(10);
   size=10;
 }
 
 void show(){
   stroke(255);
   noFill();
   ellipse(location.x, location.y, size, size);
 }
 
 void act(){
   super.act();
   
   
   if(location.x+size>=width||location.y+size>=height){
    lives =0; 
   }
 }
}
