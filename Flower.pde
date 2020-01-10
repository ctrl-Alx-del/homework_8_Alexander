class Flower {

  // Variables
  float speed; //Der blev lavet en speed variable så man kunne flytte på blomsten og sætte den til forskellig hastighed
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
  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, float temp_speed) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    speed = temp_speed;
  }

  //Mouse-controlled flower
  Flower(float temp_r, int temp_n_petals, int temp_x, int temp_y, int temp_petalColor, float temp_speed) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    speed = temp_speed;
  }

  //Rectangular Flower
  Flower(int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, float temp_speed, int tempSize) {
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    speed = temp_speed;
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
    x = x + speed;
    y = y + speed;
  }

  void bounce() {
    if (x > width-r || x < r || y > height || y < 0) {
      speed = speed * (-1);
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
