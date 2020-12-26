interface Target{
  PVector pos = new PVector();
  final byte circleSize = 100;
  public void reset();
  public void display();
  public PVector getPos();
}
class RegularTarget implements Target{
  RegularTarget(){
    reset();
  }
  public void reset(){
    pos.set(new PVector(random(width*0.2,width*0.8),random(height*0.2,height*0.8)));
  }
  public void display(){
    pushStyle();
    fill(#dddddd);
    circle(pos.x,pos.y,circleSize);
    popStyle();
  }
  public PVector getPos(){
    return pos;
  }
}
//bonus points!
class BonusTarget implements Target{
  BonusTarget(){
     reset();
  }
  public void reset(){
    pos.set(new PVector(random(width*0.2,width*0.8),random(height*0.2,height*0.8)));
  }
  
  public void display(){
    pushStyle();
    fill(#FFCD00);
    circle(pos.x,pos.y,circleSize);
    popStyle();
  }
  public PVector getPos(){
    return pos;
  }
}

//slows you down a bit when you hit it
class FreezeTarget implements Target{
  FreezeTarget(){
    reset();
  }
  
  public void reset(){
    pos.set(new PVector(random(width*0.2,width*0.8),random(height*0.2,height*0.8)));
  }
  
  public void display(){
    pushStyle();
    fill(#00CEFF);
    circle(pos.x,pos.y,circleSize);
    popStyle();
  }
  public PVector getPos(){
    return pos;
  }
}

//AVOID this one!! But it will go away after a while ;)
class BadTarget implements Target{
  private float lifespan;
  BadTarget(){
    reset();
  }
  public void reset(){
    pos.set(new PVector(random(width*0.2,width*0.8),random(height*0.2,height*0.8)));
    lifespan = 1.0;
  }
  public void update(){
    lifespan -= 0.05;
  }
  public void display(){
    pushStyle();
    fill(#FF00A6);
    circle(pos.x,pos.y,circleSize);
    popStyle();
  }
  public PVector getPos(){
    return pos;
  }
  public boolean isDead(){
    return lifespan <= 0.0;
  }
}
