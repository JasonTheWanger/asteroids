boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship ship;
UFO ufo;
int time;
ArrayList<GameObject> object;
void setup(){
 size(800,800, FX2D);
 rectMode(CENTER);
 imageMode(CENTER);
 ship= new Ship();
 int temp=int(random(0,4));
 if(temp==0){
   
   ufo=new UFO(random(15,width-15),-15,random(-1,1),random(0,1));
 }
 else if(temp==1){
   ufo=new UFO(random(15,width-15),height+15,random(-1,1),random(0.1,-1));
 }
 else if(temp==2){
   ufo=new UFO(-15,random(15,height-15),random(0.1,1),random(-1,1));
 }
 else if(temp==3){
   ufo=new UFO(width+15,random(15,height-15),random(0.1,1),random(-1,1));
 }
 object = new ArrayList<GameObject>();
 object.add(ship);
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
 time=800;
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
  time--;
  if(time<=0){
   
   object.add(ufo);
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
