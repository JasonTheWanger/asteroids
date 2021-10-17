void mouseReleased(){
  if(mode==intro)
  mode=instruction;
  else if(mode==instruction)
  mode=game;
  else if (mode==gameover)
  mode=intro;
}
