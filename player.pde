class Player{
  private PVector pos,dir;
  float speed;
  
  Player(){
    pos = new PVector(width/2,height/2);
    dir = new PVector(0,0);
    speed = 15.0;
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
      break;
    }
  }
  
  public void speedUp(){
    speed *= 1.05;
  }
  
  public void slowDown(){
    speed *= 0.8;
  }
  
  public void update(){
    pos.add(PVector.mult(dir,speed));
    if (keyPressed && key == CODED){
      switchDirection();
    }
  }
  
  public void display(){
    pushStyle();
    noStroke();
    circle(pos.x,pos.y,100);
    popStyle();
  }
  
  public PVector getPos(){
    return pos;
  }
  public boolean outOfBounds(){
    return pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height;
  }
}
