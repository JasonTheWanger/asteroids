class UFO extends Ship{
  UFO(float x, float y, float dx, float dy){
    lives = 1;
  location = new PVector(random(0,width),random(0,height));
  direction = new PVector(random(-1,1), random(-1,1));
  velocity = new PVector(direction.x*50, direction.y*50);
  shotTimer =0;
  threshold=100;
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
    super.act();
    shotTimer++;
    if(shotTimer>=threshold){
      object.add(new UFOBullet());
    }
  }
}
