public class StartScreen{  
    boolean gameStarted;
    
    StartScreen(ControlP5 gui, PFont f){
        int w = 600;
        gameStarted = false;
        gui.addButton("Start Game").setPosition(width/2 - w/2,height*0.3).setSize(w,200).setFont(f);       
        gui.addButton("Get me outta here!").setPosition(width/2 - w/2,height*0.6).setSize(w,200).setFont(f);
    }

    void display(){
        background(0);
    }
    
    public void startGame(){
      gameStarted = true;
      gui.hide();
    }
}
