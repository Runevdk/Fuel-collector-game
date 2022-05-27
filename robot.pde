class robot {

  void display(){  
//robot
push();
  translate(robotx, roboty); //oorsprong verplaatsen naar midden
  if (keyCode == LEFT) rotate(-PI/30);
  if (keyCode == RIGHT) rotate(PI/30);
  //trilling vlam
  v1 = int(random(5));
  v2 = int(random(5));
  v3 = int(random(5));
  v4 = int(random(5));
      //oog onderste laag
      noStroke();
      fill(255, 255, 255);
      ellipse(0, -185, 60, 60);
    push();
    //rotaties en translaties tijdelijk terugzetten
    if (keyCode == LEFT) rotate(PI/30);
    if (keyCode == RIGHT) rotate(-PI/30);
    translate(-robotx,-roboty);
    //schaduw
    noStroke();
    fill(60, 55, 61);
    ellipse(robotx, 775, roboty/6, roboty/14);
    pop();
    //vlam
    if(gameoverscherm == false){
        //geel 3 delen
        fill(218, 175, 80);
        triangle(-20, 65, 20, 65, 0, 145+v1);
        fill(218, 175, 80);
        triangle(-20, 65, 20, 65, -20, 95+v2);
        fill(218, 175, 80);
        triangle(-20, 65, 20, 65, 20, 95+v3);
        //vlam oranje 1 deel
        fill(142, 77, 57);
        triangle(-10, 65, 10, 65, 0, 115+v4);
    }
    //lichaam
      //boventrapezium
      fill(100, 110, 120);
      quad(-50, -135, -30, -185, 30, -185, 50, -135);
      //middenrechthoek
      fill(60, 55, 51);
      rect(-50, -135, 100, 100);
      //ondertrapezium
      fill(100, 110, 120);
      quad(-50, -35, -20, 65, 20, 65, 50, -35);
      //afrondingen
      ellipse(0, -135, 100, 15); //bovenkant rechthoek afronding
      fill(60, 55, 51);
      ellipse(0, -35, 100, 15); //onderkant rechthoek afronding
      fill(100, 110, 120);
      ellipse(0, 65, 40, 10);//onderkant onderste trapezium afronding
      fill(255);
      ellipse(0, -185, 60, 10);//oog afronding
    //oog knipperanimatie
    if (mousePressed == true){
      fill(0, 0, 0);
      rect(0, -195, 20, 3);
    } else {
      fill(0, 0, 0);
      ellipse(10, -195, 20, 25);
    }
    //details
      //lichtpuntje in oog
      fill(255);
      ellipse(10, -200, 5, 5);
      //schroeven
      fill(145, 231, 220);
      ellipse(-40, -45, 6, 7);
      fill(145, 231, 220);
      ellipse(-40, -55, 6, 7);
      //paneeltje
      rect(30, -120, 15, 20, 60, 3, 30, 3);
      //lichtstrepen
      fill(213, 215, 217);
      quad(-47, -135, -29, -180, -25, -179, -43, -134);
      quad(-46, -29, -41, -27, -13, 64, -18, 62);
    pop();
  }
}
