public class StartScreen{  
    boolean gameStarted;
    
    StartScreen(ControlP5 gui){
        int w = 500;
        gameStarted = false;
        gui.addButton("Start Game").setPosition(width/2 - w/2,height*0.3).setSize(w,200);       
        gui.addButton("Get me outta here!").setPosition(width/2 - w/2,height*0.6).setSize(w,200);
    }

    void display(){
        background(0);
    }
    
    public void startGame(){
      gameStarted = true;
      gui.hide();
    }
}
