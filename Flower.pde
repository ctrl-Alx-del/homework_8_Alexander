class Flower {

  // Variables
  float Xspeed; //Der blev lavet en speed variable så man kunne flytte på blomsten og sætte den til forskellig hastighed
  float Yspeed;
  float ballX;
  float ballY;
  float rectX;
  float rectY;

  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals
  int size;

  //Circular Flower
  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, float temp_Xspeed, float temp_Yspeed) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    Xspeed = temp_Xspeed;
    Yspeed = temp_Yspeed;
  }

  //Mouse-controlled flower
  Flower(float temp_r, int temp_n_petals, int temp_x, int temp_y, int temp_petalColor, float temp_Xspeed, float temp_Yspeed) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    Xspeed = temp_Xspeed;
    Yspeed = temp_Yspeed;
  }

  //Rectangular Flower
  Flower(int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, float temp_Xspeed, int tempSize, float temp_Yspeed) {
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    Xspeed = temp_Xspeed;
    Yspeed = temp_Yspeed;
    size = tempSize;
  }

  void display () {
    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }

    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);

    fill(petalColor);
    for (float j=0; j<PI*2; j+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      rectX=x + size*cos(j);
      rectY=y + size*sin(j);
      rect(rectX, rectY, size, size);
    }

    fill(200, 0, 0);
    rectMode(CENTER);
    rect(x, y, size, size);
  }

  void move(/*float speed*/) {
    x = x + Xspeed;
    y = y + Yspeed;
  }

  void bounce() {
    if (x > width-r || x < r) {
      Xspeed = Xspeed * (-1);
    }
    if(y > height || y < 0){
      Yspeed = Yspeed * (-1);
    }
  }

  void coloring() {
    if (switchColor) {
      petalColor = #CA0DFF;
    } else {
      petalColor = #FFA000;
    }
  }

  void mouseControl (float x, float y) {
    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }

    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }

  boolean overlaps2(Flower other) {
    if (dist(x, y, other.x, other.y) < r/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean overlaps (Flower other) {
    float distance = dist(x, y, other.x, other.y); 
    // Calculate distance    
    if (distance < r*1.2 + other.r*1.2) {              
      // Compare distance to sum of radii   
      return true;
    } else {
      return false;
    }
  }
}
