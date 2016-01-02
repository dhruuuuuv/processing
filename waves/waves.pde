float time = 0;

float[] colours = new float[2560];

void setup() {
  size(2560, 1600);
  fillArray();
  background(0);
}

void fillArray() {
  for (int i=0; i<2560; i++) {
    colours[i] = random(0,250);
  }
}

void draw() {
  background(0);
  
  fillArray();
  
  float x = 0;
  
  while (x < width) {
    
     stroke(255, 255, 255);

      point(x, 200 + 150 * noise(x / 100, time));
      //line(x, 200 + 50 * noise(x / 100, time), x, height);
      x += 1;
  }
  
  time += 0.02;
}