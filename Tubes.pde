class Tubes {
  float posX;
  float posX2;

  Tubes (float x) {
    // First set of tubes
    topTube = random(150, windowHeight - tubeMinimum);
    bottomTube = topTube + tubeGap;
    posX = x;

    // Second set of tubes
    topTube2 = random(150, windowHeight - tubeMinimum);
    bottomTube2 = topTube2 + tubeGap;
    posX2 = x + 300;
  }

  void draw() {
    fill(136, 204, 0);

    // Draw first set of tubes
    rect(posX, 0, tubeWidth, topTube);
    rect(posX, bottomTube, tubeWidth, windowHeight);

    // Draw second set of tubes
    rect(posX2, 0, tubeWidth, topTube2);
    rect(posX2, bottomTube2, tubeWidth, windowHeight);
  }

  void update() {
    // If bird is alive, move existing tubes and generate new ones as necessary
    if (birdAlive) {
      posX = posX - 2;
      posX2 = posX2 - 2;

      if (posX + tubeWidth < 0) {
        topTube = random(150, windowHeight - tubeMinimum);
        bottomTube = topTube + tubeGap;
        posX = 500;
      }

      if (posX2 + tubeWidth < 0) {
        topTube2 = random(150, windowHeight - tubeMinimum);
        bottomTube2 = topTube2 + tubeGap;
        posX2 = 500;
      }
    }
  }
}