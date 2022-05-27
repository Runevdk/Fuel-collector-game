// TITLE: Fuelcollector
// Author: Rune Vandekerckhove
/* 
    Controls:    Move with the arrowkeys to collect cans, make sure you don't run out of fuel or it is game over.
    
    Extra's:   - Click the mouse to make the robot blink
               
               - Based on the lightsensor, the background will either be night or day
               
    Good luck!
    
*/





import processing.serial.*;
Serial myPort;  // Create object from Serial class
int val;     // Data received from the serial port

//coordinaten voor positie
int robotx = 500;
int roboty = 400;
//grootte
int size = 1;
//variable voor array
int a = 0;
//brandstofniveau
int brandstof = 150;
int timer = 1;
int niveau = 1;
int timesurvived = 0;
//variabele voor schaduw
int i = 350;
//variabelen voor trilling vlam
int v1 = 0;
int v2 = 0;
int v3 = 0;
int v4 = 0;
//variabalen als grens voor verplaatsing
int rand = 25;
//geluid
import processing.sound.*;
SoundFile raakgeluid;
//data
float tempwaregem;
//achtergrondfoto
PImage desert;
PImage bijtanken;
PImage desertnight;
//variabelen locatie brandstof
int xlocatie = int((random(20, 180)) * 5);
int ylocatie = int((random(40, 120)) * 5);
//classes 
robot robot1;
brandstofniveau b;
//array
wolk[] wolken = new wolk[3];
//startscherm
boolean gameoverscherm = false;

void setup(){
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  //canvasgrootte + achtergrondfoto laden
  size(1000, 800);
  desert = loadImage("desert.jpg");
  desertnight = loadImage("desertnight.jpg");
  bijtanken = loadImage("bijtanken.png");
  raakgeluid = new SoundFile(this, "sound.wav");
  frameRate(100);
  //classes
  robot1 = new robot();
  b = new brandstofniveau();
  //array
  for(int a = 0; a < 3; a++){
    wolken[a] = new wolk();
  }
  
  String link = "https://api.openweathermap.org/data/2.5/weather?lat=25.284266&lon=14.438434&appid=20097440490f25d8eff21914a3ad636d";
  
  JSONObject data = loadJSONObject(link);
  
  JSONObject main = data.getJSONObject("main");
  tempwaregem = main.getInt("temp") -272.15;
}
void draw(){ 
  while (myPort.available() > 0){
  val = myPort.read();
  }
  print(val);
  
  //hitsysteem
  if (xlocatie < robotx+20 && xlocatie > robotx-130 && ylocatie > roboty-300 && ylocatie < roboty+100 ){
    xlocatie = int((random(20, 180)) * 5);
    ylocatie = int((random(40, 120)) * 5);
    raakgeluid.play();
    //brandstofniveau na hit
    if (niveau < 130) brandstof +=20; //als balkje niet zou overlopen
    else brandstof = timer+150; //als balkje zou overlopen komt het gewoon op max
  }
  //background(175, 138, 112); -> niet meer nodig omdat er een foto als achtergrond is
  if(val == 48){
    image(desertnight, 0, 0); //achtergrondfoto plaatsen
  } else {
    image(desert, 0, 0);
  }
  image(bijtanken, xlocatie, ylocatie, 100, 100);
  //wolken
  for(int a = 0; a < 3; a++){
    wolken[a].move();
    wolken[a].display();
    wolken[a].end();
  }
  //display classes
  robot1.display();
  b.display();
  textSize(20);
  fill(0);
  text( "Temperature Sahara: " + round(tempwaregem) + "°C", 750, 30);
  if (niveau <= 0 && roboty+rand <= 730) roboty ++;  
  //timer
  textSize(40);
  if(gameoverscherm == false){
  timesurvived = (millis()/1000);
  text(timesurvived, 490, 40);
  } else{ 
    timesurvived = timesurvived;
  }
  //eindscherm
  if (gameoverscherm == true){
    push();
    fill(255);
    text("You survived " + timesurvived + " seconds", 300, 400);
    pop();
  }
}


public void keyPressed() {
    if      (keyCode == UP    && roboty-rand >= 215 && niveau != 0)  roboty -=5;
    else if (keyCode == DOWN  && roboty+rand <= 640 && niveau != 0)  roboty +=5;
    else if (keyCode == LEFT  && robotx-rand >= 50  && niveau != 0)  robotx -=7;
    else if (keyCode == RIGHT && robotx+rand <= 950 && niveau != 0)  robotx +=7;
}

  
