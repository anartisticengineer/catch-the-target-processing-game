class Player{
  private PVector pos,dir;
  float speed;
  
  Player(){
    pos = new PVector(width/2,height/2);
    dir = new PVector(0,0);
    speed = 2.0;
  }
  
  public void switchDirection(){
    switch(keyCode){
      case UP:
        dir.set(0,-1);
      break;
      case DOWN:
        dir.set(0,1);
      break;
      case LEFT:
        dir.set(-1,0);
      break;
      case RIGHT:
        dir.set(1,0);
      break;
      default:
        dir.set(0,0);
      break;
    }
  }
  
  public void speedUp(){
    speed += 0.1;
  }
  
  public void update(){
    pos.add(PVector.mult(dir,speed));
    if (keyPressed && key == CODED){
      switchDirection();
    }
  }
  
  public void display(){
    circle(pos.x,pos.y,20);
  }
  
  public PVector getPos(){
    return pos;
  }
}