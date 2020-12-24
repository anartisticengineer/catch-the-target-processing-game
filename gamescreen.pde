public class GameScreen{
  private int score;
  
  Player p1;
  
  GameScreen(){
    score = 0;
    p1 = new Player();
  }
  
  private void hud(){
    text("Score: "+str(score),width/2,height*0.1);
  }
  
  public void display(){
    background(0);
    hud();
    p1.update();
    p1.display();
  }
  
  public int getScore(){
    return score;
  }
}
