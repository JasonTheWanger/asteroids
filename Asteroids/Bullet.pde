class Bullet extends GameObject{
  
  int timer;
 Bullet(){
   timer =70;
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
   
   timer--;
   
   if(timer<=0){
    lives =0; 
   }
 }
}
