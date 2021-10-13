class AsteroidParticles extends Asteroid{
  int t;
  PVector nudge;
  PVector location, velocity, direction;
  AsteroidParticles(int s, float x, float y){
   lives =1;
    size=int(random(5,12));
    t=int(random(200,255));
    location = new PVector(x,y);
    nudge = ship.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(30);
    location.add(nudge);
    velocity = ship.direction.copy();
    velocity.rotate(PI+random(-3.14,3.14));
    velocity.setMag(3);
  }
  void show(){
    //square(location
  }
  void act(){
    
  }
}
