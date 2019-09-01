PImage dog;
int velocidade = 0;

void setup() {
  size(800, 600);
  dog = loadImage("dog1.png"); 
  background(200);
}

void draw() {

  if (velocidade < 2000) {
    for (int i = 0; i < 2; i+= 1) {
      float x = random(width);
      float y = random(height);
      color c =dog.get(int(x), int(y));
      noStroke();
      fill(c,75);
      ellipse(x, y, 15, 15);
    }
  } else if (velocidade < 3000) {
    for (int i = 0; i < 50; i+= 1) {
      float x = random(width);
      float y = random(height);
      color c =dog.get(int(x), int(y));
      noStroke();
      fill(c, 25);
      ellipse(x, y, 15, 15);
    }
  } else if (velocidade < 4500) {
    for (int i = 0; i < 100; i+= 1) {
      float x = random(width);
      float y = random(height);
      color c =dog.get(int(x), int(y));
      noStroke();
      fill(c, 25);
      ellipse(x, y, 15, 15);
    }
  } else {
    for (int i = 0; i < 500; i+= 1) {
      float x = random(width);
      float y = random(height);
      color c =dog.get(int(x), int(y));
      noStroke();
      fill(c, 25);
      ellipse(x, y, 15, 15);
    }
  }
  velocidade += 2;
}
