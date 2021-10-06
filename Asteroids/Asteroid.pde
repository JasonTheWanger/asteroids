class Asteroid extends GameObject{
  
  Asteroid(){
    lives=1;
    location = new PVector(random(0,width), random(0,height));
    velocity = new PVector(0,1);
    velocity.rotate(random(0, TWO_PI));
    size=100;
  }
  void show(){
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }
  
  void act(){
    super.act();
    
    for(int i=0; i<object.size(); i++){
     GameObject GB = object.get(i);
     if(GB instanceof Bullet){
       if(dist(location.x, location.y, GB.location.x, GB.location.y)<=size/2 + GB.size){
         GB.lives--;
         lives--;
         
       }
     }
    }
  }
}
