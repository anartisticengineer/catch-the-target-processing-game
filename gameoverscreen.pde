public class GameOverScreen{
  private boolean gameEnded;
  private PFont f;
  
  GameOverScreen(){
    gameEnded = false;
    f = createFont("Verdana",40);
  }
  
  public void display(int score_){ 
    gameEnded = true;
    textFont(f);
    text("GAME OVER!\nScore: "+str(score_)+"\nPress 'R' to Try Again\nOr 'X' to exit",width/2,height/2);
  }
  
  public void restarted(){
    gameEnded = false;
  }
}
