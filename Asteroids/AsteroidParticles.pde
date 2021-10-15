class AsteroidParticles extends GameObject{
  int t;
  PVector direction;
  AsteroidParticles(float x, float y){
   lives =1;
    size=int(random(5,12));
    t=int(random(200,255));
    location = new PVector(x,y);
    velocity = new PVector(-5,5);
    velocity.rotate(PI+random(-3.14,3.14));
    velocity.setMag(20);
  }
  void show(){
    noStroke();
    fill(255,0,0,t);
  square(location.x, location.y, size);
  }
  void act(){
    super.act();
    t-=10;
    if(t<=0) 
    lives = 0;
  }
}
