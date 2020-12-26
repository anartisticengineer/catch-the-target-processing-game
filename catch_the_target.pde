import controlP5.*;

ControlP5 gui;

StartScreen startScreen;
GameScreen gameScreen;

void setup() {
    fullScreen();
    pixelDensity(pixelDensity);
    textAlign(CENTER,CENTER);
    
    gui = new ControlP5(this);
    startScreen = new StartScreen(gui);
    gameScreen = new GameScreen();
}

void draw() {
    background(255,0,0);
    //start
    if (!startScreen.gameStarted){
      startScreen.display();
    } else{
    //game
      gameScreen.run();
    }   
    //game over
}

public void controlEvent(ControlEvent event){
  String eventName = event.getController().getName();
  switch(eventName){
    case "Start Game":
      startScreen.startGame();
    break;
    case "Get me outta here!":
      exit();
    break;
  } 
}
