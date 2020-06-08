import processing.sound.*;
// If exporting to Application, must manually move filse to "data" folder within Java folder

// Global Variables
Tubes tubes;
Bird bird;
Score scoreBoard;

PFont f;
SoundFile point;
SoundFile wing;
SoundFile hit;
SoundFile die;

int windowWidth = 500;
int windowHeight = 600;

float gravity = .2;

float birdX = windowWidth / 2;
float birdY = windowHeight / 2;
float birdRadius = 10;

float birdJumpSpeed = 10;
float birdVelocity = 0;

boolean birdJump;
boolean birdAlive = true;

float topTube, topTube2;
float bottomTube, bottomTube2;
float tubeX = 500;
float tubeGap = 80;
float tubeWidth = 100;
float tubeMinimum = 150;

int score;
float scoreX = windowWidth / 2;
float scoreY = 60;

boolean endSoundPlayed;

void settings() {
  size(windowWidth, windowHeight);
  
}

void setup() {
  background(0, 0, 0);
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on

  bird = new Bird(birdX, birdY);
  tubes = new Tubes(tubeX);
  scoreBoard = new Score();
  point = new SoundFile(this, "point.wav");
  wing = new SoundFile(this, "wing.mp3");
  hit = new SoundFile(this, "hit.mp3");
  die = new SoundFile(this, "die.mp3");

  // Reset global variable values every time setup() is called (For game restart)
  score = 0;
  scoreX = windowWidth / 2;

  birdJumpSpeed = 10;
  birdVelocity = 0;
  birdAlive = true;
  birdJump = false;

  endSoundPlayed = false;
}

void draw() {
  background(204, 255, 255);

  tubes.draw();
  bird.draw();
  scoreBoard.draw();

  tubes.update();
  bird.update();
  scoreBoard.update();
  
  bird.collisionCheck();
}

void keyPressed() {
  // Unable to prevent key repeat due to OS restrictions
  if (key == ' ' && birdAlive) {
    birdJump = true;
    wing.play();
  }

  if (key == CODED && keyCode  == DOWN) {
    loop(); // For some reason, calling any sort of function that resumes draw() moves Score text to the left
    setup();
  }
}

void keyReleased() {
  if (key == ' ' && birdAlive) {
    birdJump = false;
  }
}