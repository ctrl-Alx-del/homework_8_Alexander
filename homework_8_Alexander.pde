Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;  // the second instance of the Flower class
Flower myFlower3;
Flower myFlower4;
Flower myFlower5;
boolean switchColor = false;
int increment = 1;
int circleSpace = 50;

void setup() {
  size(1200, 900);

  int _r1= 60;
  int _r2 = 100;
  int _r3 = 120;
  int _r5 = 15;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc=#FFA000;
  int offset = 350;

  //Regular flower
  myFlower1 = new Flower(_r1, _petals, _x, _y, _pc, 2, 2); 
  myFlower2 = new Flower(_r2, _petals, _x+50, _y+offset, _pc, -5, 5);
  myFlower3 = new Flower(_r3, _petals, _x+50, _y+offset, _pc, 7, 7);
  myFlower5 = new Flower(_r5, _petals, _x+50, _y-offset, _pc, 7, 7); 

  //rectangular flower
  myFlower4 = new Flower(_petals, _x+50, _y-offset/2, _pc, 7, 50, 7);
}

void draw() {
  background(#43AF76);

  myFlower1.display();
  myFlower1.move();  
  myFlower1.bounce();
  myFlower1.coloring();
  myFlower2.display();
  myFlower2.move();
  myFlower2.bounce();
//  myFlower3.display();
  //myFlower3.move();
  //myFlower3.bounce();
 // myFlower4.display();
  //myFlower4.move();
  //myFlower4.bounce();

  myFlower5.mouseControl(mouseX, mouseY);

  //Når de forskellige blomster overlapper så stiger increment

  if (myFlower1.overlaps(myFlower2) || myFlower1.overlaps(myFlower3) || myFlower1.overlaps(myFlower4)|| myFlower1.overlaps(myFlower5) || myFlower2.overlaps(myFlower3) || myFlower2.overlaps(myFlower4)|| myFlower2.overlaps(myFlower5) || myFlower3.overlaps(myFlower4)|| myFlower3.overlaps(myFlower5)) {
    increment++;
  }

  text("Score " + increment, 50, 50);

  //Der kommer en ny circel hver increment når 50. Da i kun bliver increased med circleSpace = 50.
  for (int i = 0; i <= increment; i = i + circleSpace) {
    ellipse(i, 100, 50, 50);
  }

  println(increment);
  if (increment >= circleSpace*10) {
    increment= 0;
  }


  if (mousePressed) {
    switchColor = true;
  } else {
    switchColor = false;
  }
}
