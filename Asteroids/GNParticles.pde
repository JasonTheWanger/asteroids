class GNParticles extends GameObject{
  int t;
  PVector nudge;
  GNParticles(){
    lives =1;
    size=int(random(5,12));
    t=int(random(200,255));
    //loc= new PVector(ship.location.x,ship.location.y);
    location = ship.location.copy();
    nudge = ship.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(30);
    location.add(nudge);
    velocity = ship.direction.copy();
    velocity.rotate(PI+random(-0.5,0.5));
    velocity.setMag(3);
  }
  void show(){
    noStroke();
    fill(#33F0A9,t);
  square(location.x, location.y, size);
}
  void act(){
    super.act();
    t-=10;
    if(t<=0) 
    lives = 0;
  }
}
