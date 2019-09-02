int score1, score2; //score1 => score of player 1(left), score2 => score of player 2(right)
int sizeX = 700, sizeY = 400; // canvas size
boolean start = false; 

Bar b1 = new Bar(15);
Bar b2 = new Bar(sizeX-30);

class Bar {
  int posX = 15, posY = sizeY/2;

  Bar (int _x) {
    posX = _x;
  }

  void show() {
    fill(255);
    //noStroke();
    rect(posX, posY, 15, 50);
  }

  void moveUp() {
    if (posY > 5) {
      posY -= 15;
    }
  }

  void moveDown() {
    if (posY < sizeY-65) {
      posY += 15;
    }
  }
}

void setup() {
  size(700, 400);
}

void keyPressed() {
  //Inicia o movimento da bola
  if (key == ' ') {
    start = true;
  }
  //Controla barra da esquerda
  if (key == 'w') {
    b1.moveUp();
  } else if (key == 's') {
    b1.moveDown();
  }
  //Controla barra da direita
  if (keyCode == UP) {
    b2.moveUp();
  } else if (keyCode == DOWN) {
    b2.moveDown();
  }
}

void draw() {
  background(0);
  b1.show();
  b2.show();
  fill(255);
  rect(sizeX/2, 0, 5, sizeY);
  fill(255);
  noStroke();
  ellipse((sizeX/2)+2, sizeY/2, 15, 15);
  if (start == true) {
  }
}
