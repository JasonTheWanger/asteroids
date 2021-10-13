boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship ship;
ArrayList<GameObject> object;
void setup(){
 size(800,800, FX2D);
 rectMode(CENTER);
 imageMode(CENTER);
 ship= new Ship();
 object = new ArrayList<GameObject>();
 object.add(ship);
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
}

void draw(){
  background(0);
  //ship.show();
  //ship.act();
  
  for(int i=0; i<object.size(); i++){
   GameObject GB = object.get(i);
   GB.show();
   GB.act();
   
   if(GB.lives==0){
    object.remove(i);
    i--;
   }
  }
}

void keyPressed(){
 if(keyCode == UP)
 upkey=true;
 if(keyCode == DOWN)
 downkey=true;
 if(keyCode == LEFT)
 leftkey=true;
 if(keyCode == RIGHT)
 rightkey=true;
 if(keyCode == ' ')
 spacekey=true;
 
}

void keyReleased(){
 if(keyCode == UP)
 upkey=false;
 if(keyCode == DOWN)
 downkey=false;
 if(keyCode == LEFT)
 leftkey=false;
 if(keyCode == RIGHT)
 rightkey=false;
 if(keyCode == ' ')
 spacekey=false;
 
}
