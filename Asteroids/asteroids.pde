boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship ship;
UFO ufo;
int time;
boolean ifUFO;
ArrayList<GameObject> object;
void setup(){
 size(800,800, FX2D);
 rectMode(CENTER);
 imageMode(CENTER);
 ship= new Ship();
 ifUFO=true;
 object = new ArrayList<GameObject>();
 object.add(ship);
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
 object.add(new Asteroid());
 time=1000;
}

void draw(){
  background(0);
  
  for(int i=0; i<object.size(); i++){
   GameObject GB = object.get(i);
   GB.show();
   GB.act();
   
   if(GB.lives==0){
     if(GB instanceof UFO){
     time=1000;
     ifUFO=true;
     }
    object.remove(i);
    i--;
   }
  }
  time--;
  if(time<=0&&ifUFO){
    int temp=int(random(0,4));
 if(temp==0){
   
   ufo=new UFO(random(15,width-15),-15,random(-0.15,0.15),random(0.3,1));
 }
 else if(temp==1){
   ufo=new UFO(random(15,width-15),height+15,random(-0.15,0.15),random(-0.3,-1));
 }
 else if(temp==2){
   ufo=new UFO(-15,random(15,height-15),random(0.3,1),random(-0.15,0.15));
 }
 else if(temp==3){
   ufo=new UFO(width+15,random(15,height-15),random(-0.3,-1),random(-0.15,0.15));
 }
   object.add(ufo);
   ifUFO=false;
  }
  println(time);
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
