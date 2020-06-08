class Bird {
  float posX;
  float posY;

  Bird(float x, float y) {
    posX = x;
    posY = y;
  }
  
  // Draw bird
  void draw() {
    stroke(0);
    fill(255,230,102);
    ellipse(150, posY, birdRadius * 2, birdRadius * 2);
  }

  // Gravity force on Bird unless Bird is alive AND space bar is pressed
  void update() {
    birdVelocity += gravity;
    posY = posY + birdVelocity;

    if (birdAlive && birdJump) {
      if (birdVelocity > -2) {
        birdVelocity = -3.5;
      }
    }

    // Make sure Bird doesn't go above window
    posY = constrain(posY, 0 + birdRadius, height);
  }

  // If bird hits tubes or ground, call restartScreeen();
  void collisionCheck() {
    if (posY >= height - birdRadius) {
      birdAlive = false;
      restartScreen();
    }

    if((tubes.posX + (birdRadius * 6) > tubeWidth) && (tubes.posX - (birdRadius * 6) < tubeWidth)) {  
      if ((posY + (birdRadius) > bottomTube) || (posY - birdRadius < topTube)) {
        birdAlive = false;
        restartScreen();
      }
    }

    if((tubes.posX2 + (birdRadius * 6) > tubeWidth) && (tubes.posX2 - (birdRadius * 6) < tubeWidth)) {  
      if ((posY + (birdRadius) > bottomTube2) || (posY - birdRadius < topTube2)) {
        birdAlive = false;
        restartScreen();
      }
    }
  }

  void restartScreen() {
    // Only play end sound once per setup()
    if (endSoundPlayed == false) {
      hit.play();
      die.play();
      endSoundPlayed = true;
    }

    textFont(f,16);
    textAlign(CENTER, BOTTOM);
    fill(0, 0, 255);
    text("You lose! Press DOWN to restart.", width / 2, height / 2);
    fill(255, 255, 255);

    if (posY >= height - birdRadius) {
      noLoop();
    }
  }
}