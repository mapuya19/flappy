class Score {

  // Empty default constructor; can be updated later for more specific use cases
  Score() {
    
  }

  void draw() {
    textFont(f, 64);
    fill(0, 0, 0);
    text("Score: " + score, scoreX + 2, scoreY + 2);
    fill(255, 255, 255);
    text("Score: " + score, scoreX, scoreY);
  }

  void update() {
    if (birdAlive) {
      if (bird.posX == (tubes.posX + (tubeWidth)) || bird.posX == (tubes.posX2 + (tubeWidth))) {
        score++;
        point.play();
      }
    }
  }
}
