import processing.serial.*;

Serial myPort; // porta de leitura
int val = 0;
int portValue; // valor lido na porta
int numRect = 15; // numero de retangulos
color[] colors = new color[numRect]; // cor dos retangulos
int[] heights = new int[numRect]; // altura dos retangulos de acordo com a leitura da porta
boolean max = false; // false se tiver no minimo true se tive saido do valor minimo

void setup() {
  size(600, 400); 
  noStroke();

  //print(Serial.list());
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);

  colors[0] = color(240, 6, 7);
  colors[1] = color(227, 14, 8);
  colors[2] = color(242, 45, 10);
  colors[3] = color(252, 199, 31);
  colors[4] = color(255, 246, 65);
  colors[5] = color(220, 245, 40);
  colors[6] = color  (70, 207, 118);
  colors[7] = color  (83, 179, 50);
  colors[8] = color(83, 222, 57);
  colors[9] = color(22, 238, 165);
  colors[10] = color(19, 218, 249);
  colors[11] = color(20, 167, 244);
  colors[12] = color(39, 122, 244);
  colors[13] = color(55, 43, 247);
  colors[14] = color(136, 32, 233);
  frameRate(15);
}

void draw() {
  background(0);

  //if (myPort.available() > 0) {
  portValue = int(random(0, 50));//myPort.read();
  println(portValue);
  //}

  if (max) {
    if (val > 10) {
      val -= 10;
    } else {
      max = false;
    }
  } else {
    if (portValue < 10) {
      val = 10;
    }
  }

  for (int i = 0; i < numRect; i++) {
    fill(colors[i]);
    if (portValue > 10) {
      val = portValue*int(random(1, 4)); //val*int(random(4));

      max = true;
    }
    rect(40*i, 0, 40, val);
  }
}
