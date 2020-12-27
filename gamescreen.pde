public class GameScreen{
  
  private int score,targetType;
  Player p1;
  GameOverScreen gameOverScreen;
  private Target [] targets = {new RegularTarget(),new BonusTarget(),new FreezeTarget(),new BadTarget()};
  private boolean gameOver;
  
  GameScreen(PFont f){
    textFont(f);
    reset();
    gameOverScreen = new GameOverScreen();
  }
  
  private void hud(){
    textSize(20);
    text("Score: "+str(score)+"\n\nSpeed: "+str(p1.speed),width*0.1,height*0.1);
  }
  
  public void nextTarget(){
    if (score % 20 > 15 && score > 0){
      //choose a special target
      targetType = round(random(1,3));
    } else {
      targetType = 0;
    }
    targets[targetType].reset();
  }
  
  public void run(){
    background(0);
    if (gameOver == false){
      hud();
      targets[targetType].display();
      if(targetType == 3 && targets[targetType].isDone()){
        nextTarget();
      }
      //registered hits
      if (hitTarget()){
        //bonus target
        score+=(targetType == 1)?5*int(p1.speed):int(p1.speed);
        //freeze target
        if (targetType == 2){
          p1.slowDown();
        } else if (targetType == 3){
          gameOver(); //player hit the bad target! :(
        } else {
          p1.speedUp();
        } 
        nextTarget();
      }
      pushStyle();
      stroke(#ff0000);
      line(p1.getPos().x,p1.getPos().y,targets[targetType].getPos().x,targets[targetType].getPos().y);
      popStyle();
      p1.update();
      p1.display();
      //did the player get out of bounds?
      if (p1.outOfBounds()){
        gameOver();
      }
    } else{
      //game is over!
      gameOverScreen.display(score);
      if (keyPressed){
        if (key == 'R' || key == 'r'){
          gameOverScreen.restarted();
          reset();
        }
        else if (key == 'X' || key == 'x'){
          exit();
        }
      }
    }
  }
  //register the hit of the target
  public boolean hitTarget(){
    return PVector.sub(p1.getPos(),targets[targetType].getPos()).mag() < 50;
  }
  
  public int getScore(){
    return score;
  }
  
  public void reset(){
    score = 0;
    targetType = 0;
    p1 = new Player();
    gameOver = false;
  }
  
  public void gameOver(){
    gameOver = true;
  }
}
