PImage dino, tree, cloud;

float  gravity = 2;
int count = 0; /* numero de arvores geradas */
int count2 = 0; /* numero de nuvens */

Dino d = new Dino();
Tree[] t = new Tree[1000];
Cloud[] c = new Cloud[1000];


class Dino {
  int size = 50;  /* tamanho do dinossauro */
  int posX =  50; /* posicao horizontal do dinossauro */
  int posY = 350 - size; /* posicao vertical do dinossauro */
  int jump = 0;   /* velocidade do pulo */
  void show() {
    //rect(posX, posY, size, size);
    image(dino, posX, posY, size, size);
  }
  void jump() {
    if (posY == 350 - size) { /* garante que so pula quando ta no chao */
      jump = -25;
    }
  }
  void move() {
    /* limita a altura do pulo */
    posY += jump;
    jump += gravity;
    posY = constrain(posY, 0, height - size);
  }
}

class Tree {
  int sizeX = 30;
  int sizeY = 35;
  int posX = 600;
  int posY =  350 - sizeY;

  void move() { /* aumenta a velocidade de acordo com o numero de arvores geradas */
    if (count > 5) {
      posX -= 7;
    } else if (count > 10) {
      posX -= 10;
    } else if (count <= 5) {
      posX -= 5;
    } else if (count > 20) {
      posX -= 13;
    }
  }

  void show() {
    //rect(posX, posY, sizeX, sizeY);
    image(tree, posX, posY, sizeX, sizeY);
  }
}

class Cloud {
  int posX = 600;
  float posY;
  Cloud(float y) {
    posY = y;
  }
  void move() {
    posX -= 3;
  }
  void show() {
    image(cloud, posX, posY, 100, 100);
  }
}

void setup() {
  size(600, 350);
  dino = loadImage("dino.png");
  tree = loadImage("tree.png");
  cloud = loadImage("nuvem.png");
}

void keyPressed() {
  if (key == ' ') {
    d.jump();
  }
  if (key == 'r'){
   loop(); 
  }
}

void draw() {
  background(220);

  if (random(0, 100) < 1 && count2 < 1000) {
    c[count2] = new Cloud(random(50, 150));
    count2+=1;
  }

  if (random(0, 100) < 0.5 && count < 1000) {
    t[count] = new Tree(); 
    count += 1;
  }

  for (int j = 0; j < count2; j +=1) {
    c[j].show();
    c[j].move();
  }

  for (int i = 0; i < count; i += 1) {
    t[i].show();
    t[i].move();
    if (d.posX + d.size > t[i].posX && d.posX < t[i].posX + t[i].sizeX && d.posY + d.size > t[i].posY) {
      /* detecta colisao */
      noLoop();
    }
  }

  d.show();
  d.move();
}
