import ddf.minim.*;

Minim m;
AudioSample hitSound;

int score1 = 0, score2 = 0; //score1 => score of player 1(left), score2 => score of player 2(right)
int sizeX = 700, sizeY = 400; // canvas size
boolean start = false; 
boolean init = true;

Bar b1 = new Bar(15);
Bar b2 = new Bar(sizeX-30);
Ball ball = new Ball();

class Bar {
  public int posX = 15, posY = sizeY/2, speed = 5, curSpeed = 0;

  Bar (int _x) {
    posX = _x;
  }

  void show() {
    fill(2, 208, 244);
    rect(posX, posY, 15, 50);
  }

  void moveUp() {
    curSpeed = -speed;
  }

  void moveDown() {
    curSpeed = speed;
  }
  
  void stop() {
    curSpeed = 0;
  }
  
  void move() {
    posY += curSpeed;
    if (posY > sizeY - 65) {
      posY = sizeY-65;
    } else if (posY < 5) {
      posY = 5;
    }
  }
}

class Ball {
  public int posX = (sizeX/2) + 2, posY = sizeY/2;
  public int vx = -3, vy = 2; // positive values moves right and down, negative values moves left and up

  void show() {
    fill(252, 131, 2);
    ellipse(posX, posY, 15, 15);
  }

  void reset() {
    if (random(0, 1) == 0) {
      vx *= -1;
    } else {
      vy *=-1;
    }
    posX = (sizeX/2) + 2;
    posY = sizeY/2;
  }

  void changeDirection() {
    vx *= -1;
  }
  void move() {
    if (posY+7 > sizeY) {
      vy *= -1;
    } else if (posY-7 < 0) {
      vy *= -1;
    }
    posX += vx;
    posY += vy;
  }
}

//Returns 0 if ball collides to one of the bars, 1 if ball pass by left bar, 2 if ball pass by right bar
int collision(Ball ball, Bar b1, Bar b2) {
  if (ball.posX-(15+7) < b1.posX && (ball.posY < b1.posY+50 && ball.posY+7 > b1.posY) ) {
    return 0;
  } else if (ball.posX+7 > b2.posX && (ball.posY < b2.posY+50 && ball.posY+7 > b2.posY) ) {
    return 0;
  }
  if (ball.posX-(15+7) < b1.posX ) {
    if (ball.posY > b1.posY+50 || ball.posY+7 < b1.posY) {
      return 2;
    }
  }
  if (ball.posX+7 > b2.posX) {
    if (ball.posY > b2.posY+50 || ball.posY+7 < b2.posY) {
      return 1;
    }
  }
  return 3;
}


void setup() {
  size(700, 400);
  noStroke();
  m = new Minim(this);
  hitSound = m.loadSample("Beep8.mp3",512); 
}

void keyPressed() {
  //Starts ball moviment
  if (key == ' ') {
    start = true;
    init = false;
  }
  //Left bar controls
  if (key == 'w') {
    b1.moveUp();
  } else if (key == 's') {
    b1.moveDown();
  }
  //Right bar controls
  if (keyCode == UP) {
    b2.moveUp();
  } else if (keyCode == DOWN) {
    b2.moveDown();
  }
}
void keyReleased() {
  //Left bar controls
  if (key == 'w' || key == 's') {
    b1.stop();
  }
  //Right bar controls
  if (keyCode == UP || keyCode == DOWN) {
    b2.stop();
  }
}

void draw() {
  //Board
  background(53);
  fill(255);
  rect(sizeX/2, 0, 5, sizeY);
  for (int i = 10; i < sizeY; i = i + 15) {
    fill(53);
    rect(sizeX/2, i, 5, 7);
  }
  //Start message
  if (init) {
    fill(247, 4, 93);
    textSize(30);
    text("Press space bar to begin", (sizeX/2)-170, (sizeY/2)+100);
  } 

  //Scores
  fill(255);
  textSize(45);
  text(Integer.toString(score1), (sizeX/2)-110, 65);


  fill(255);
  textSize(45);
  text(Integer.toString(score2), (sizeX/2)+100, 65);

  //Objects
  b1.show();
  b2.show();
  ball.show();
  b1.move();
  b2.move();

  if (start == true) {
    ball.move();
  }
  if (collision(ball, b1, b2) == 0) {
    hitSound.trigger();
    ball.changeDirection();
  }
  //if left player scores
  if (collision(ball, b1, b2) == 1) {
    score1++;
    ball.reset();
    start = false;
    //init = true;
  }
  //if right player scores
  else if (collision(ball, b1, b2) == 2) {
    score2++;
    ball.reset();
    start = false;
    //init = true;
  }
}
