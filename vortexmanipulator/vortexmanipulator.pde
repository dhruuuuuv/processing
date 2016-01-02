// Stars parameters
int           depth = 8;
int           nbStarsMax = 100000;
Stars[]       tabStars = new Stars[nbStarsMax];
int           maxStarsSpeed = 5;

// Drawing parameters
int           sizeX = 2560;
int           sizeY = 1600;
boolean       clearScreen = true;
int           taille = 1;
int           transparency = 255;

// Rotation variable
int           rotationMode = 3;
float         angle = 0;
float         delta = radians(0.25);

float red = 255.0;
float green = 255.0;
float blue = 255.0;

/*
-----------------------------------------------------------------
  INITIALISATION
-----------------------------------------------------------------
*/
void setup() {
  String strX, strY;
  size(2560,1600,P3D);
  colorMode(RGB,255);
  loop();
  smooth(8);
  strokeWeight(taille);
  //----------------------------------------------
  // Stars initialisation
  // -----------------------
  for(int nb=0; nb<nbStarsMax; nb++) {
    tabStars[nb] = new Stars(random(-2*width,2*width),random(-2*height,2*height),
                               -random(depth*255),random(1,maxStarsSpeed));
  }  
}

/*
-----------------------------------------------------------------
  DRAWING
-----------------------------------------------------------------
*/
void draw() {
  // Clear screen
  if(clearScreen == true) {
    background(0);
  }
  translate(width/2+((mouseX-(width/2))*10)/(width/2),
            height/2+((mouseY-(height/2))*10)/(height/2),
            0);
  rotateY(-((mouseX-(width/2))*radians(30))/(width/2));
  rotateX(((mouseY-(height/2))*radians(30))/(width/2));
  if(rotationMode==1) {
    angle += delta;
  }
  if(rotationMode==2) {
    angle -= delta;
  }
  rotateZ(angle);
  for(int nb=0; nb<nbStarsMax; nb++) {
    tabStars[nb].aff();
    tabStars[nb].anim();
  }  
}

/*
-----------------------------------------------------------------
  KEY Gesture
-----------------------------------------------------------------
*/
void keyPressed() {
  if (key == 'v') {
    clearScreen = !clearScreen;
  }

  if(key=='/') {
    if(transparency<255)
      transparency += 1;
  }
  if(key=='*') {
    if(transparency>2)
      transparency -= 1;
  }
  if(key=='3') {
    rotationMode = 3;
  }
    if(key=='a') {
    if (red <= 255) {
    red = (red + 1);
    }
  }
  if(key=='s') {
    if (blue <= 255) {
    blue = (blue + 1);
    }
  }
  if(key=='d') {
    if (green <= 255) {
    green = (green + 1);
    }
  }
  if(key=='z') {
    if (red >= 0) {
    red = (red - 1);
    }
  }
  if(key=='x') {
    if (blue >= 0) {
    blue = (blue - 1);
    }
  }
  if(key=='c') {
    if (green >= 0) {
    green = (green - 1);
    }
  }
  //if(key=='q'){
  //  for(int nb=0; nb<nbStarsMax; nb++) {
  //  tabStars[nb].randomiseColour();
  //  }
  //} 
  if(key==' ') {
    background(0);
  }
}
/*
-----------------------------------------------------------------
  MOUSE Gesture
-----------------------------------------------------------------
*/
void mousePressed() {
  if(mouseButton==LEFT)
    rotationMode = 1;
  if(mouseButton==RIGHT)
    rotationMode = 2;
  if(mouseButton==CENTER)
    rotationMode = 3;
}


/*
-----------------------------------------------------------------
 Stars class
-----------------------------------------------------------------
*/
class Stars {
  float x, y, z;
  float dZ;
  
  Stars(float coordX, float coordY, float coordZ, float speedZ) {
    x  = coordX;  
    y  = coordY;  
    z  = coordZ;  
    dZ = speedZ;
  }
  
  void aff() {
    stroke(red+z/depth, green+z/depth, blue+z/depth, transparency);
    point(x,y,z);
  }
  
  //void randomiseColour() {
  //  float blue = random(50,200);
  //  float red = random(50,200);
  //  float green = random(50, 200);
  //}
  
  void anim() {
    z = z + dZ;
    if(z>=0)
      z = -1023.0;
  }
}