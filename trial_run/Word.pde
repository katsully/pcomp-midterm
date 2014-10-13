class Word {

  // seperate array for bad words?
  // busted
  String[] words = {"FIERCE", "WORK IT", "BAM!", "DUSTED"};

  int textSize;
  int xPos;
  int yPos;
  int alpha;

  Word(int tempTextSize, int tempXPos, int tempYPos) {
    textSize = tempTextSize;
    xPos = tempXPos;
    yPos = tempYPos;
    alpha = 255;
  }

  void display() {
    fill(35, 25, 133, alpha);
    text(words[0], xPos, yPos);
  }

  void fade() {
    alpha -= .01;
  }
}
