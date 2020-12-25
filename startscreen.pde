public class StartScreen{  
    boolean gameStarted;
    
    StartScreen(ControlP5 gui){
        int w = 200;
        gameStarted = false;
        gui.addButton("Start Game").setPosition(width/2 - w/2,200).setSize(w,50);       
        gui.addButton("Get me outta here!").setPosition(width/2 - w/2,400).setSize(w,50);
    }

    void display(){
        background(0);
    }
    
    public void startGame(){
      gameStarted = true;
      gui.hide();
    }
}
