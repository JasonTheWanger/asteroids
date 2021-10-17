class UFOBullet extends GameObject {
  int timer;
  UFOBullet() {
    timer =100;
    lives =1;
    location=ufo.location.copy();
    velocity=new PVector(ship.velocity.x+(ship.location.x-location.x), ship.velocity.y+(ship.location.y-location.y));
    velocity.setMag(10);
    size=10;
  }

  void show() {
    stroke(#0B84DE);
    noFill();
    ellipse(location.x, location.y, size, size);
  }
  void act() {
    super.act();

    timer--;

    if (timer<=0) {
      lives =0;
    }
  }
}
