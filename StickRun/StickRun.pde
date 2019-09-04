PImage[] sticks = new PImage[9];
PFont fonte;
int i = 0;
int posX = -70, posY = 232;

void setup() {
  size(500, 300);
  for (int i = 0; i < sticks.length; i++) {
    sticks[i] = loadImage("tmp-"+i+".gif");
  }
  fonte = loadFont("AbadiMT-CondensedExtraBold-48.vlw");
  frameRate(40);
}

void draw() {
  background(255);
  fill(0, 50);
  textFont(fonte);
  textSize(20);
  text("Seta p/ direita para correr ", 140, 80);
  image(sticks[i], posX, posY, 70, 70);
  if (keyPressed == true) {
    if (keyCode == RIGHT) {
      image(sticks[i], posX, posY, 70, 70);
      if (i+1 == sticks.length) {
        i = 0;
      }
      if (i < sticks.length) {
        i++;
      }
      if (posX > width+30) {
        posX = -70;
      } else {
        posX++;
      }
    }
  }
}
