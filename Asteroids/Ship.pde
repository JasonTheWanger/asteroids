class Ship extends GameObject{
  
 
 PVector direction;
 int shotTimer, threshold;
 
 Ship(){
  lives = 3;
  location = new PVector(width/2, height/2);
  velocity = new PVector(0,0);
  direction = new PVector(0,-0.1);
  shotTimer =0;
  threshold=60;
 }
 
 void show(){
   pushMatrix();
   translate(location.x, location.y);
   rotate(direction.heading());
   noFill();
   stroke(255);
   triangle(-25,-12.5,-25,12.5,25,0);
   
   popMatrix();
 }
 void act(){
   super.act();
   
   shotTimer++;
   
   if(upkey){
   velocity.add(direction);
   object.add(new GNParticles());
   object.add(new GNParticles());
   object.add(new GNParticles());
   }
   if(downkey)
   velocity.sub(direction);
   if(leftkey)
   direction.rotate(-radians(5));
   if(rightkey)
   direction.rotate(radians(5));
   if(spacekey && shotTimer>threshold){
   object.add(new Bullet());
   shotTimer=0;
   }
 }
}
