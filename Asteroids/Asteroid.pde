class Asteroid extends GameObject{
  
  Asteroid(){
    lives=1;
    location = new PVector(random(0,width), random(0,height));
    velocity = new PVector(0,1);
    velocity.rotate(random(0, TWO_PI));
    size=int(random(25,101));
  }
  
  Asteroid(int s, float x, float y){
   lives=1;
   location = new PVector(x,y);
   velocity = new PVector(0,1);
   velocity.rotate(random(0, TWO_PI));
   size=s;
  }
  void show(){
    noFill();
    stroke(255);
    square(location.x, location.y, size);
  }
  
  void act(){
    super.act();
    
    for(int i=0; i<object.size(); i++){
     GameObject GB = object.get(i);
     if(GB instanceof Bullet){
       if(dist(location.x, location.y, GB.location.x, GB.location.y)<=size/2 + GB.size){
         GB.lives--;
         lives--;
         if(size/2>=25){
         object.add(new Asteroid(size/2, location.x, location.y));
         object.add(new Asteroid(size/2, location.x, location.y));
         }
       }
     }
    }
  }
}
