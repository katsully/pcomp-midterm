class Clock {

  int xPos = height/2;
  int yPos = width/2;
  int time = 60;


  void display() {
    fill(0,255,0);
    textSize(64);
    text(time + " SECONDS", xPos, yPos);
  }

  void countdown() {
    time--;
    println("here " + time);
  }
}
