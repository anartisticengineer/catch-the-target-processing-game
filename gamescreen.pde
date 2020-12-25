public class GameScreen{
  
  private int score,targetType;
  Player p1;
  private Target [] targets = {new RegularTarget(),new BonusTarget(),new FreezeTarget(),new BadTarget()};
  
  GameScreen(){
    score = 0;
    targetType = 0;
    p1 = new Player();  
  }
  
  private void hud(){
    textSize(20);
    text("Score: "+str(score),width*0.1,height*0.1);
  }
  
  public void nextTarget(){
    if (score % 20 == 0 && score > 0){
      //choose a special every 
      targetType = round(random(1,3));
    } else {
      targetType = 0;
    }
    targets[targetType].reset();
  }
  
  public void display(){
    background(0);
    hud();
    p1.update();
    p1.display();
    targets[targetType].display();
    if (hitTarget()){
      println("I'm hit!");
      nextTarget();
      score++;
      p1.speedUp();
    }
  }
  
  public boolean hitTarget(){
    return PVector.sub(p1.getPos(),targets[targetType].getPos()).mag() < 50;
  }
  
  public int getScore(){
    return score;
  }
}
