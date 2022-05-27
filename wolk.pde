class wolk{
  
  float h;
  float w;
  float size;
  float wspeed;
  
  wolk() {
    h = random(10, 400);
    size = random (25, 50);
    w = -size;
    wspeed = random(0.1, 1);
  }
  
  void move(){
    w = w + wspeed;
  }
  
  void display(){
    noStroke();
    fill(255);
    ellipse(w, h, size*1.5, size);
    ellipse(w - (size/1.2), h+(size/10), (size/2)*1.5, size/2);
    ellipse(w + (size/1.2), h+(size/10), (size/2)*1.5, size/2);
  }
  void end(){
  if(w >= width+(size*2)){
    w = -size;
  }
  }
}
