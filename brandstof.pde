class brandstofniveau{

void display(){
//brandstofniveau balkje
    noStroke();
    fill(255);
    rect(10, 10, 150, 30, 2);
    fill(255, 0, 0);
    niveau = brandstof-timer;
    rect(10, 10, niveau, 30, 2);
    //timer
    if(niveau==0){
      textSize(30);
      text("out of fuel", 15, 35);
      gameoverscherm = true;
    }
    else{
    timer = frameCount/10;
    }
}
    
}
