class UFOBullet extends Bullet{
  
  UFOBullet(){
    timer =60;
   lives =1;
   location=ufo.location.copy();
   velocity=new PVector(ship.location.x*ship.direction.x,ship.location.y*ship.direction.y);
   velocity.setMag(10);
   size=10;
  }
  
  void show(){
    stroke(#0B84DE);
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
