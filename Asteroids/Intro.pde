void Intro(){
  image(gif[f], width/2, height/2, width, height);
  
  if(frameCount%2==0)
  f++;
  if(f==49)
  f=0;
  textAlign(CENTER,CENTER);
  textSize(50);
  text("Asteroid", width/2, height/3);
  textSize(15);
  text("Click to start, \"p\" to pause", width/2, height/2);
  bool=true;
}
